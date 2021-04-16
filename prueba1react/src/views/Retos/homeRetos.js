import React from 'react';
import {Text,View,StyleSheet,} from "react-native";

export default function HomeRetos(){
    return(
        <View style={styles.container}>
            <Text>Bienvenido a el Modulo de Retos</Text>
              
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