require 'mechanize'
require './env.rb'

agent = Mechanize.new
agent.user_agent_alias = 'Mac Safari 4'

url = 'https://portal.nap.gsic.titech.ac.jp/GetAccess/Login?Template=userpass_key&AUTHMETHOD=UserPassword'
matrix_url = 'https://portal.nap.gsic.titech.ac.jp/GetAccess/Login?Template=idg_key&AUTHMETHOD=IG&GASF=CERTIFICATE,IG.GRID&LOCALE=ja_JP&GAREASONCODE=13&GAIDENTIFICATIONID=UserPassword&GARESOURCEID=resourcelistID2&GAURI=https://portal.nap.gsic.titech.ac.jp/GetAccess/ResourceList&Reason=13&APPID=resourcelistID2&URI=https://portal.nap.gsic.titech.ac.jp/GetAccess/ResourceList'

agent.get(url) do |page|
  response = page.form_with('login') do |form|
    formdata = {
      :usr_name => @usr_name,
      :usr_password => @usr_password
    }
    form.field_with('usr_name').value = formdata[:usr_name]
    form.field_with('usr_password').value = formdata[:usr_password]
  end.submit
end

@token_data = {}

agent.get(matrix_url) do |page|
  indicies = page.search('table').search('tr').search('th').slice(5, 7).text
  index_data = {
    :i1 => [indicies[1, 3][0], indicies[1, 3][-1].to_i],
    :i2 => [indicies[6, 3][0], indicies[6, 3][-1].to_i],
    :i3 => [indicies[11, 3][0], indicies[11, 3][-1].to_i],
  }
  @token_data = {
    :m1 => @usr_matrix[index_data[:i1][0]][index_data[:i1][1] - 1],
    :m2 => @usr_matrix[index_data[:i2][0]][index_data[:i2][1] - 1],
    :m3 => @usr_matrix[index_data[:i3][0]][index_data[:i3][1] - 1]
  }
  response = page.form_with('login') do |form|
    form.field_with('message3').value = @token_data[:m1]
    form.field_with('message4').value = @token_data[:m2]
    form.field_with('message5').value = @token_data[:m3]
  end.submit
end
