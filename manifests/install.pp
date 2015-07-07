class drone::install {
	exec { 'retrieve_drone':
		command => "/usr/bin/wget http://downloads.drone.io/master/drone.deb -O /tmp/drone.deb",
		creates => "/tmp/drone.deb",
	}

	file { 'drone.deb':
		name => '/tmp/drone.deb',
		mode => 0644,
		require => Exec["retrieve_drone"],
	}

	package { 'drone':
		ensure => installed,
		provider => dpkg,
		source => '/tmp/drone.deb',
		require => File['drone.deb']
	}
}