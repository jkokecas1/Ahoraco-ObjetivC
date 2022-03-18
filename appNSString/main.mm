#import <Foundation/Foundation.h>
#include <iostream>
using namespace std;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        
        int ndatos, errores = 0;
        NSArray *pri,*colores;
        NSMutableString *palabra,*cadena;
        
        pri = [NSArray arrayWithObjects:@"╔══════╗",@"║",@"║",@"║",@"║",@"╚═════════", nil];
        
        NSMutableArray* vecAux = [[NSMutableArray alloc]
        initWithArray:pri];
     
        colores = [NSArray arrayWithObjects:@"Jabon",@"Goma",@"Cinta",@"Gancho",@"Blanco",@"Sofa",@"Agua",@"Cinta", nil];
        char opc;
        do{
            
            NSLog(@"JUEGO DEL AHORCADO");
            NSLog(@"INICIANDO JUEGO");
            
            ndatos = arc4random_uniform(7);
            cadena = [NSMutableString stringWithFormat:@""];
            //Asignamos la palabra aleatoria
            palabra = colores[ndatos];
            //Imprimimos el primer diagrama
            for(NSString *p in pri)
                NSLog(@"%@",p);
            //Escribimos la barra donde va cada caracter de la palabra
            for (int i=0; i< palabra.length; i++) {
                [cadena appendFormat:@"_"];
            }
            // Se imprime esa cadena
            do{
                char letra;
                NSRange match;
                NSString *p;
                fflush( stdin );
                NSLog(@"%@\n",cadena);
                //NSLog(@"%@",palabra);
                letra = 0;
                NSLog(@"PRECIONA UNA LETRA DEL TECLADO(A-Z)");
                scanf("%c",&letra);
                
                if(letra != '\0'){
                //NSLog(@"%c",letra);
                    match = [palabra rangeOfString:[NSString stringWithFormat:@"%c",letra]];
                    
                    if(match.location == NSNotFound){
                        //NSLog(match.location);
                            errores = errores + 1;
                            switch (errores) {
                                case 1:
                                    [vecAux replaceObjectAtIndex:1 withObject:[NSString stringWithFormat:@"║      O"]];
                                    
                                    for(p in vecAux)
                                        NSLog(@"%@",p);
                                    break;
                                case 2:
                                    [vecAux replaceObjectAtIndex:2 withObject:[NSString stringWithFormat:@"║      |"]];
                                    
                                    for(p in vecAux)
                                        NSLog(@"%@",p);
                                    break;
                                case 3:
                                    [vecAux replaceObjectAtIndex:3 withObject:[NSString stringWithFormat:@"║      |"]];
                                    
                                    for(p in vecAux)
                                        NSLog(@"%@",p);
                                    break;
                                case 4:
                                    [vecAux replaceObjectAtIndex:2
                                                      withObject:[NSString stringWithFormat:@"║     /|"]];
                                    for(p in vecAux)
                                        NSLog(@"%@",p);
                                    break;
                                case 5:
                                    [vecAux replaceObjectAtIndex:2
                                                      withObject:[NSString stringWithFormat:@"║    _/|"]];
                                    for(p in vecAux)
                                        NSLog(@"%@",p);
                                    break;
                                case 6:
                                    [vecAux replaceObjectAtIndex:2
                                                      withObject:[NSString stringWithFormat:@"║    _/|\\ "]];
                                    for(p in vecAux)
                                        NSLog(@"%@",p);
                                    break;
                                case 7:
                                    [vecAux replaceObjectAtIndex:2
                                                      withObject:[NSString stringWithFormat:@"║    _/|\\_ "]];
                                    for(p in vecAux)
                                        NSLog(@"%@",p);
                                    break;
                                case 8:
                                    [vecAux replaceObjectAtIndex:4
                                                      withObject:[NSString stringWithFormat:@"║     /"]];
                                    for(p in vecAux)
                                        NSLog(@"%@",p);
                                    break;
                                case 9:
                                    [vecAux replaceObjectAtIndex:4
                                                      withObject:[NSString stringWithFormat:@"║     / \\ "]];
                                    for(p in vecAux)
                                        NSLog(@"%@",p);
                                    break;
                                default:
                                    break;
                            }
                            NSLog(@"ERRORES : %i",errores);
                        }else{
                            [cadena replaceCharactersInRange: NSMakeRange(match.location,1) withString: [NSString stringWithFormat:@"%c",letra]];
                            for(p in vecAux)
                                NSLog(@"%@",p);
                            
                            //[cadena replaceCharactersInRange:NSRangeFromString(palabra) withString:[NSString stringWithFormat:@"%c",letra]];
                            //cadena[match.location] =[NSString stringWithFormat:@"%c",letra];
                        }
                }

            }while([palabra isNotEqualTo:cadena] && errores < 10);
            
            if([palabra isEqual:cadena]){
                NSLog(@"FELICIDADES ADIVINASTE LA PALABRA");
            }else
                NSLog(@"GAME OVER");
            
            errores =0;
        
            
            NSLog(@"DESA JUGAR DE NUEVO?(S/N)");
            scanf("%c", &opc);
            
        }while(opc == 'S');
    
    }
    return 0;
}
