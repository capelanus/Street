//
//  Taxista.h
//  Street
//
//  Created by iDaniel on 11/02/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Taxista : NSObject{

NSString *placa;
NSString *nombre;
NSString *apellido;
NSString *dni;
NSString *nacionalidad;
    NSString *imageData;


}

@property(strong,nonatomic) NSString *placa;
@property(strong,nonatomic) NSString *nombre;
@property(strong,nonatomic) NSString *apellido;
@property(strong,nonatomic) NSString *dni;
@property(strong,nonatomic) NSString *nacionalidad;
@property (strong, retain) NSString *imageData;


-(id)initWithPlaca:(NSString *) cPlaca andNombre:(NSString *) cNombre andApellido:(NSString *) cApellido andDni:(NSString *) cDni andNacionalidad:(NSString *) cNacionalidad andImage:(NSString *) cImageData;



@end
