class drone::install {
	exec { 'retrieve_drone':
		command => "/usr/bin/wget http://downloads.drone.io/latest/drone.deb -O /tmp/drone.deb",
		creates => "/tmp/drone.deb",
	}

	file { '/tmp/drone.deb':
		mode => 0644,
		require => Exec["retrieve_drone"],
	}
}