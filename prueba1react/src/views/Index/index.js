import React from 'react';
import {Text, View, Button} from "react-native";

export default function Index({navigation}){

  return(
  <View>
    <Text> Estas en el Index</Text>
    <Button title=" Ir a Home" onPress={()=>navigation.navigate('Home')}/>
  </View>

  );

}

  