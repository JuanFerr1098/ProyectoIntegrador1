import React from 'react';
import {Text, View, StyleSheet, SafeAreaView ,TouchableOpacity} from 'react-native';
import {Button,Appbar} from 'react-native-paper';

import {AntDesign, Entypo, Ionicons} from "@expo/vector-icons";


const gray = "#91A18D";
const MORE_ICON = Platform.OS === 'ios' ? 'dots-horizontal' : 'dots-vertical';

export default function HomeAprendizaje ({navigation}) {
  
  const NeuMorph = ({children, size, style}) =>{
    return(
      <View style={styles.topShadow}>
        <View style={styles.bottomShadow}>
          <View 
            style={[
            styles.inner,
            { width: size || 40, height: size || 40, borderRadius: size /2 || 40/2},
            style
            ]}
          >
            {children}
          </View>
        </View>
      </View>
    );
  };
  
      return (
        <View style={styles.container}>
     
          <SafeAreaView>

          <Appbar.Header
          style={styles.header}
          >
          <Appbar.BackAction onPress={()=>navigation.navigate('Home')} color="#FFFFFF"  />
            
            <Appbar.Content title="Aprendizaje" color="#FFFFFF" />
       
         
              {/* <Appbar.Action icon="magnify" onPress={() => {}} /> */}
              <Appbar.Action icon={MORE_ICON} onPress={() => {}} color="#FFFFFF" />
          </Appbar.Header>

            <View style={{marginHorizontal:5, marginTop:32}}>
              <View style={styles.topContainer}>
                {/* <NeuMorph size={48}>
                  <AntDesign name="arrowleft" size={20} color={gray}/>
                </NeuMorph> */}
                
            
             {/*      <View style={styles.topContainer}>
                    <Text style={styles.titulo} > CURSOS </Text>
                  </View>
                   */}

                  {/* <NeuMorph size = {48}>
                    <Entypo name="menu" size={20} color={gray} />
                  </NeuMorph>    */}                          
              </View>
            </View>

            {/* Lineas de botones circulares       */}  
            <View style={styles.areaSegura}>   

              <View style={styles.botonContainer}>
                <Button mode="contained"  style={styles.buttonPurple} 
                  onPress={()=>navigation.navigate('Curso')}>
                  <Text style={styles.botonText}>A</Text>
                </Button>
                <Button mode="contained" style={styles.buttonPurple} 
                  onPress={()=>navigation.navigate('Home')}>
                  <Text style={styles.botonText}>B</Text>
                </Button>
                <Button mode="contained" style={styles.buttonPurple} 
                 onPress={()=>navigation.navigate('Home')}>
                 <Text style={styles.botonText}>C</Text>
              </Button>
              </View>
              <View style={styles.botonContainer}>
                <Button mode="contained"  style={styles.buttonPurple} 
                    onPress={()=>navigation.navigate('Curso')}>
                    <Text style={styles.botonText}>A2</Text>
                </Button>
                <Button mode="contained" style={styles.buttonPurple} 
                    onPress={()=>navigation.navigate('Home')}>
                    <Text style={styles.botonText}>B2</Text>
                </Button>
                <Button mode="contained" style={styles.buttonPurple} 
                    onPress={()=>navigation.navigate('Home')}>
                    <Text style={styles.botonText}>C2</Text>
                </Button>
            </View> 
              <View style={styles.botonContainer}>
                <Button mode="contained"  style={styles.buttonPurple} 
                    onPress={()=>navigation.navigate('Curso')}>
                    <Text style={styles.botonText}>A3</Text>
                </Button>
                <Button mode="contained" style={styles.buttonPurple} 
                    onPress={()=>navigation.navigate('Home')}>
                    <Text style={styles.botonText}>B3</Text>
                </Button>
                <Button mode="contained" style={styles.buttonPurple} 
                    onPress={()=>navigation.navigate('Home')}>
                    <Text style={styles.botonText}>C3</Text>
                </Button>
            </View>
              <View style={styles.botonContainer}>
                <Button mode="contained"  style={styles.buttonPurple} 
                  onPress={()=>navigation.navigate('Curso')}>
                  <Text style={styles.botonText}>A4</Text>
                </Button>
                <Button mode="contained" style={styles.buttonPurple} 
                  onPress={()=>navigation.navigate('Home')}>
                  <Text style={styles.botonText}>B4</Text>
                </Button>
                <Button mode="contained" style={styles.buttonPurple} 
                  onPress={()=>navigation.navigate('Home')}>
                  <Text style={styles.botonText}>C4</Text>
                </Button>
            </View>
            
            </View>

          </SafeAreaView>
        </View>
      );
}

const styles = StyleSheet.create ({
  container: {
    flex: 1,
    
    alignItems: 'center',
    backgroundColor: '#EFEEEE',
  },
  topContainer: {
    //flexDirection:"row",
    marginTop:20,
    justifyContent:"space-between",
    alignItems: 'center',
  },

  botonContainer: {
    flexDirection:"row",
    justifyContent:"space-between",
    alignItems: 'center',
    marginLeft : 20,
    marginRight : 20,

  },

  header :{
    paddingHorizontal: 20,
    
    backgroundColor:"#00c49a",
  },
  areaSegura:{
    justifyContent:"center",
    flex:1,
      alignItems: 'center',
  },
  inner: {
    backgroundColor:"#EFEEEE",
    alignItems: 'center',
    justifyContent:"center",
    borderColor:"#FFF",
    borderWidth : 1,
  },

  topShadow:{
    shadowOffset : {
      width : -6,
      height : -6
    },
    shadowOpacity : 10,
    shadowRadius: 6,
    shadowColor: "#FFFFFF",
  },

  bottomShadow:{
    shadowOffset : {
      width : 6,
      height : 6
    },
    shadowOpacity : 1,
    shadowRadius: 6,
    shadowColor: "#D1CDC7"
  },

  titulo : {
    fontWeight: "bold",
    color : "#00c49a",
    fontSize: 50,
  },
  buttonPurple: {
    backgroundColor: "#00c49a",
    width:100,
    height:100,
    alignItems:'center',
    justifyContent:'center',
    padding:10,
    margin: 10,
    borderRadius: 50,  

  },

  botonText:{
    color : "#FFFFFF",
    fontSize: 30,
  },
});
