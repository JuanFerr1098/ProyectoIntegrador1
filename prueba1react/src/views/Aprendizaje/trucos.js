//Hacer que este archivo sea como una clase a la que le entrarias unos parametros
// y de la base de datos traeria los trucos para los slides y los reticos

import React, {Component}from 'react';
import {Text, View,TouchableOpacity,StyleSheet, ScrollView,Image} from "react-native";
import { TextInput, Button, Title } from 'react-native-paper';



export default function Index({navigation})  {
 
/* let dimensions = Dimensions.get("window"); */
 /*  let imageHeight = Math.round((dimensions.width*9)/16);
  let imageWidth = dimensions.width; */
  
    return(
    <View style={{flex: 1,
     backgroundColor:'#457b9d', 
     //justifyContent: 'center',
     alignItems: 'center',
     marginTop:10}}>

        <ScrollView style={{borderWidth:1, borderColor:'#dddddd'}} 
        horizontal={true}
        >

            <Image source={require('./Materiales/azul.jpg')}
                    style={{resizeMode: "center"}}
                    />

            <Image source={require('./Materiales/rojo.jpg')}
                    style={{resizeMode: "center"}}
                    />

             <Image source={require('./Materiales/rosa.jpg')}
                    style={{resizeMode: "center"}}
                    />

           {/*   <Image source={require('./Materiales/azul.jpg')}
                    style={{
                        resizeMode: "center",
                        height:imageHeight, width:imageWidth
                        }}
                    />
            */}
        {/*         <View style={{ borderWidth:0.5, borderColor:'#ffb703', resizeMode: 'cover'}}>
                    <Image source={require('./Materiales/azul.jpg')}
                    style={{resizeMode: "center"}}
                    />
                </View>

                <View style={{borderWidth:1, borderColor:'#ffb703',}}>
                    <Image source={require('./Materiales/rojo.jpg')}
                    style={{resizeMode: "center"}}
                    />
                </View>
        
                <View style={{borderWidth:1, borderColor:'#ffb703',}}>
                    <Image source={require('./Materiales/rosa.jpg')}
                    style={{resizeMode: "center"}}
                    />
                </View>
        
          */}

        </ScrollView>
    </View>

    );

};