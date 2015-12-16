//
//  Taxista.m
//  Street
//
//  Created by iDaniel on 11/02/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "Taxista.h"

@implementation Taxista

@synthesize placa, nombre,apellido,dni,nacionalidad, imageData;

static Taxista *sharedTaxista = nil;



-(id)initWithPlaca:(NSString *) cPlaca andNombre:(NSString *) cNombre andApellido:(NSString *) cApellido andDni:(NSString *) cDni andNacionalidad:(NSString *) cNacionalidad andImage:(NSString *) cImageData;{
    
    
    self = [super init];
    if(self){
        
        placa = cPlaca;
        nombre = cNombre;
        apellido = cApellido;
        dni = cDni;
        nacionalidad = cNacionalidad;
        imageData = cImageData;

        
    }
    return self;
    
}



@end
