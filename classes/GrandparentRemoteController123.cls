global virtual with sharing class GrandparentRemoteController123 {
    @RemoteAction
    global static String sayHello(String helloTo) {
        system.debug('entered the code');
        return 'Hello ' + helloTo + ' from the Grandparent.';
    }
}