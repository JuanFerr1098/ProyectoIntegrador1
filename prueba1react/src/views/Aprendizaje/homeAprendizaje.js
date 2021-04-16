import React from 'react';
import {Text,View,StyleSheet,} from "react-native";

export default function HomeAprendizaje(){
    return(
        <View style={styles.container}>
            <Text>Bienvenido a el Modulo de Aprendizaje</Text>
              
        </View>

    );
}

const styles = StyleSheet.create ({
    container: {
      flex: 1,
      justifyContent: 'center',
      alignItems: 'center',
      backgroundColor: 'white',
    }
});