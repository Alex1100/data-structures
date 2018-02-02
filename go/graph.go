package main

import (
  "fmt"
)

type DataValueStruct struct {
  Value map[interface{}][]interface{}
}

type DataStruct struct {
  DataInfo  string
  DataValue *DataValueStruct
  DataComma string
}

type NodesValueStruct struct {
  Value []interface{}
}

type Node struct {
  NodesArrayInfo  string
  NodesArray      *NodesValueStruct
  NodesArrayComma string
}

type EdgesValStruct struct {
  Value []interface{}
}

type EdgesStruct struct {
  EdgesInfo string
  Edges     *EdgesValStruct
}

type Graph struct {
  Data  *DataStruct
  Nodes *Node
  Edges *EdgesStruct
}

type gph *Graph

func InitGraph(key interface{}) *Graph {
  a := make(map[interface{}][]interface{});
  b := make([]interface{}, 0);
  c := make([]interface{}, 0);
  d := make([]interface{}, 0);
  b = append(b, key);
  c = append(c, key);
  a[key] = b;
  
  Val := &DataValueStruct{Value: a}
  NodeVal := &NodesValueStruct{Value: c}
  EdgesVal := &EdgesValStruct{Value: d}
  
  DataInstance := &DataStruct{
    DataInfo: "Data:",
    DataValue: Val,
    DataComma: ",",
  }
  
  NodeInstance := &Node{
    NodesArrayInfo: "NodesArray:",
    NodesArray: NodeVal,
    NodesArrayComma: ",",
  }
  
  EdgesInstance := &EdgesStruct{
    EdgesInfo: "Edges:",
    Edges: EdgesVal,
  }
  
  return &Graph{
    Data: DataInstance,
    Nodes: NodeInstance,
    Edges: EdgesInstance,
  }
}

func main() {
  go_graph := InitGraph("hello");
  
  fmt.Println("\nSHOULD RETURN TRUE: ", "hello" == go_graph.Data.DataValue.Value["hello"][0])
}
