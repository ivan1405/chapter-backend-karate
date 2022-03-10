function fn() {

    var environment = karate.properties['env'];
    if(!environment) {
        environment = 'localhost'
    }

    var port = karate.properties['port'];
    if(!port) {
        port = '8082'
    }

    var host = 'localhost';
    if('dev' === environment) {
        // configure your host here
        host = 'dev.services.whatever'
    }

    karate.log('using ' + environment + ' environment')

    return {
        apiBasePath: 'http://' + host + ':' + port + '/car-dealer/v1'
    };
}