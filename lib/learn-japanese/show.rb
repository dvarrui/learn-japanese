require "colorize"
require "unicode/display_width"

class Show
  def self.line
    puts ("=" * 20).white
  end

  def self.table(data)
    maxcol = 5
    lines = [
      %w[a i u e o],
      %w[ka ki  ku  ke ko | kya kyu kyo],
      %w[sa shi su  se so | sha shu sho],
      %w[ta chi tsu te to | cha chu cho],
      %w[na ni  nu  ne no | nya nyu nyo],
      %w[na ni  nu  ne no | nya nyu nyo],
      %w[ha hi  fu  he ho | hya hyu hyo],
      %w[ya SP  yu  SP yo],
      %w[ra ri  ru  re ro | rya ryu ryo],
      %w[wa SP  SP  SP wo],
      %w[SP SP  SP  SP n],
      %w[ga gi  gu  ge go | gya gyu gyo],
      %w[za ji  zu  ze zo | ja  ju  jo],
      %w[da dji dzu de do | dja dju djo],
      %w[ba bi  bu  be bo | bya byu byo],
      %w[pa pi  pu  pe po | pya pyu pyo],
      ]
    lines.each do |line|
      jap_line = []
      esp_line = []
      line.each do |es|
        if es == 'SP'
          es = ja = ''
        elsif es == '|'
          ja = '|'
        else
          ja = data[es]
          if ja.nil?
            puts "[WARN] add symbol: #{es}"
            next
          end
        end
        jap_line << ja
        jap_line << " " * (maxcol - Unicode::DisplayWidth.of(ja))
        esp_line << es
        esp_line << " " * (maxcol - es.length)
      end
      puts jap_line.join("").light_blue
      puts esp_line.join("").blue
    end
    puts "\n"
  end

  def self.puts_data(data)
    lines = data.group_by { |k, _v| k[-1]}

    lines.each do |_k, items|
      line1 = []
      line2 = []
      maxcol = 5
      items.each do |es, ja|
        line1 << ja
        line1 << " " * (maxcol - Unicode::DisplayWidth.of(ja))
        line2 << es
        line2 << " " * (maxcol - es.length)
      end
      puts line1.join("").light_blue
      puts line2.join("").blue

    end
    puts "\n"
  end
end
