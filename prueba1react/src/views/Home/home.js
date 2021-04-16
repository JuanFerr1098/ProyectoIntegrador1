import React from 'react';
import {Text, View, StyleSheet, TouchableOpacity} from 'react-native';

export default function Home ({navigation}) {
  return (
    <View style={styles.container}>
      <Text>Bienvenido a Newton App</Text>
      <Text>Quieres ir a...</Text>

      <TouchableOpacity
        onPress={() => navigation.navigate ('HomeAprendizaje')}
        style={styles.button}
      >
        <Text style={styles.buttonText}>Aprendizaje</Text>
      </TouchableOpacity>

      <TouchableOpacity
        onPress={() => navigation.navigate ('HomeRetos')}
        style={styles.button}
      >
        <Text style={styles.buttonText}>Retos</Text>
      </TouchableOpacity>

    </View>
  );
}

const styles = StyleSheet.create ({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'white',
  },
  button: {
    backgroundColor: 'black',
    padding: 7,
    marginTop: 10,
  },
  buttonText: {
    color: 'white',
    fontSize: 20,
  },
});
