package main

import (
  "fmt"
)

type Graph struct {
  DataInfo  string
  Data  map[interface{}][]interface{}
  DataComma string
  NodesArrayInfo  string
  Nodes []interface{}
  NodesArrayComma string
  EdgesInfo string
  Edges []interface{}
}

type gph *Graph

func InitGraph(node interface{}) *Graph {
  d := make(map[interface{}][]interface{});
  c := make([]interface{}, 0);
  a := make([]interface{}, 0);
  b := make([]interface{}, 0);
  c = append(c, node);
  b = append(b, node);
  d[node] = b;

  return &Graph{
    DataInfo: "Data:",
    Data: d,
    DataComma: ",",
    NodesArrayInfo: "NodesArray:",
    Nodes: b,
    NodesArrayComma: ",",
    EdgesInfo: "Edges:",
    Edges: a,
  };
}


func (g *Graph) AddNode(node interface{}) {
  if g.Data[node] == nil {
    newNode := make([]interface{}, 0);
    newNode = append(newNode, node);
    g.Data[node] = newNode;
    g.Nodes = append(g.Nodes, node);
  } else {
    return;
  }
}

func main() {
  go_graph := InitGraph("hello");
  fmt.Println(go_graph)
  fmt.Println("\nSHOULD RETURN TRUE: ", "hello" == go_graph.Data["hello"][0]);
  fmt.Println("\nNEWLY ADDED NODE IS: ", go_graph.Nodes[len(go_graph.Nodes) - 1]);
  
  go_graph.AddNode("bye");
  
  fmt.Println("\nNEWLY ADDED NODE IS: ", go_graph.Nodes[len(go_graph.Nodes) - 1]);
  fmt.Println("\nSHOULD RETURN TRUE: ", go_graph.Data);
  
  go_graph.AddNode("bye");
  
  fmt.Println("\nSHOULD RETURN TRUE: ", go_graph.Data);
}
