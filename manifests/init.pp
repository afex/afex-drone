class drone (

) inherits drone::params {
	class { '::drone::install': } ->
	class { '::drone::config': } ->
	Class['drone']
}