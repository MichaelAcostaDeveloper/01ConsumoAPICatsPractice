/**
 * @author            : Fernando M. Acosta P.
 * @Equipo            : CRM
 * @last modified on  : 08-31-2024
 * @last modified by  : Fernando M. Acosta P.
 * @Descripción       : Clase apex que consume un servicio externo.
 **/
public with sharing class CatsService {
    public static List<Cat> getCats(){
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:My_Cats');//Colocar el named credential
        req.setMethod('GET');
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        String data = res.getBody();
        List<Cat> catsDeserialized = (List<Cat>)JSON.deserializeStrict(data,List<Cat>.class);
        // System.debug(catsDeserialized);
        return catsDeserialized;
    }
    public class Cat{
        public String id;
        public String url;
        public Integer width;
        public Integer height;
    }
}

//Para usar la clase apex de consumo del servicio usar:
// CatsService.getCats();
// List<CatsService.Cat> listCats = CatsService.getCats();
// System.debug(listCats);
// System.debug(listCats[0]);
// System.debug(listCats[0].id);
// System.debug(listCats[0].url);
// System.debug(listCats[0].width);
// System.debug(listCats[0].height);