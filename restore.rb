require 'pit'

config = Pit.get('titech')
@usr_name = config['usr_name']
@usr_password = config['usr_password']
@usr_matrix = Hash[*[('A'..'J').to_a, config['usr_matrix']].transpose.flatten]
