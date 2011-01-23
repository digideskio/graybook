require 'graybook/importer/page_scraper'
require 'hpricot'

##
# Imports contacts from GMail

class Graybook::Importer::Gmail < Graybook::Importer::PageScraper

  RETRY_THRESHOLD = 5
  ##
  # Matches this importer to an user's name/address

  def =~(options = {})
    options && options[:username] =~ /@(gmail|googlemail).com$/i ? true : false
  end

  ##
  # login to gmail

  def login
    page = agent.get('http://mail.google.com/mail/')
    form = page.forms.first
    form.Email = options[:username]
    form.Passwd = options[:password]
    page = agent.submit(form,form.buttons.first)

    return Graybook::Problem.new("Username and password were not accepted. Please check them and try again.") if page.body =~ /Username and password do not match/

    if page.search('//meta').first.attributes['content'] =~ /url='?(http.+?)'?$/i
      page = agent.get $1
    end
    true
  end

  ##
  # prepare this importer

  def prepare
    login
  end

  ##
  # scrape gmail contacts for this importer

  def scrape_contacts
    unless agent.cookies.find { |c|
        c.name == 'GAUSR' && c.value.match(/mail(.*?):#{options[:username]}/)
      }
      return Graybook::Problem.new("Username and password were not accepted. Please check them and try again.")
    end

    page = agent.get('http://mail.google.com/mail/h/?v=cl&pnl=a')
    title = page.search("//title").inner_text
    if title == 'Redirecting'
      redirect_text = page.search('//meta').first.attributes['content'].inner_text
      url = redirect_text.match(/url='(http.*)'/i)[1]
      page = agent.get(url)
    end

    contact_rows = page.search("//input[@name='c']/../..")
    contact_rows.collect do |row|
      columns = row/"td"
      email = columns[2].inner_html.gsub( /(\n|&nbsp;)/, '' ) # email
      clean_email = email[/[a-zA-Z0-9._%+-]+@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,4}/]

      unless clean_email.empty?
        columns = row/"td"
        {
          :name  => ( columns[1] / "b" / "a" ).inner_html.strip, # name
          :email => clean_email
        }
      end
    end.compact
  end

  Graybook.register(:gmail, self)
end
