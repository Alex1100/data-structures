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
}

type gph *Graph

func InitGraph(node interface{}) *Graph {
  d := make(map[interface{}][]interface{});
  c := make([]interface{}, 0);
  b := make([]interface{}, 0);
  c = append(c, node);
  d[node] = b;

  return &Graph{
    DataInfo: "Data:",
    Data: d,
    DataComma: ",",
    NodesArrayInfo: "NodesArray:",
    Nodes: b,
  };
}


func (g *Graph) AddNode(node interface{}) {
  if g.Data[node] == nil {
    newNode := make([]interface{}, 0);
    g.Data[node] = newNode;
    g.Nodes = append(g.Nodes, node);
  } else {
    return;
  }
}

func (g *Graph) Contains(node interface{}) bool {
  if g.Data[node] != nil {
    return true;
  } else {
    return false;
  }
}

func (g *Graph) RemoveNode(node interface{}) (interface{}, error) {
  if g.Data[node] == nil {
    return nil, "Doesn't exist";
  }

  newNodesArray := make([]interface{}, 0);
  
  for _, ref := range g.Data[node] {
    newDataRef := make([]interface{}, 0)
    for _, element := range g.Data[ref] {
      if element != node {
        newDataRef = append(newDataRef, node);
      }
    }
    g.Data[ref] = newDataRef
  }
  
  for _, element := range g.Nodes {
    if element != node {
      newNodesArray = append(newNodesArray, element)
    }
  }
  
  g.Nodes = newNodesArray
  
  delete(g.Data, node);
  return node, nil;
}

func (g *Graph) HasEdge(fromNode, toNode interface{}) bool {
  for _, node := range g.Data[fromNode] {
    if node == toNode {
      return true;
    }
  }
  
  return false;
}

func (g *Graph) AddEdge(fromNode, toNode interface{}) (*Graph, error) {
  if g.Data[fromNode] == nil || g.Data[toNode] == nil {
    return nil, nil
  }
  g.Data[fromNode] = append(g.Data[fromNode], toNode)
  g.Data[toNode] = append(g.Data[toNode], fromNode)
  return g, nil;
}

func (g *Graph) RemoveEdge(fromNode, toNode interface{}) (*Graph, error) {
  if g.Data[fromNode] == nil || g.Data[toNode] == nil {
    return nil, nil
  }
  newFromNodeArray := make([]interface{}, 0);
  newToNodeArray := make([]interface{}, 0);

  for _, element := range g.Data[fromNode] {
    if element != toNode {
      newFromNodeArray = append(newFromNodeArray, element);
    }
  }
  
  for _, element := range g.Data[toNode] {
    if element != fromNode {
      newToNodeArray = append(newToNodeArray, element);
    }
  }
  
  g.Data[fromNode] = newFromNodeArray;
  g.Data[toNode] = newToNodeArray;
  return g, nil;
}



func main() {
  go_graph := InitGraph("hello");
  fmt.Println(go_graph)
  go_graph.AddNode("bye");
  fmt.Println("\nNEWLY ADDED NODE IS: ", go_graph.Nodes[len(go_graph.Nodes) - 1]);
  fmt.Println(go_graph.Contains("hello"))
  fmt.Println(go_graph.HasEdge("hello", "bye"));
  fmt.Println(go_graph.RemoveNode("hello"))
  fmt.Println(go_graph)
  fmt.Println(go_graph.AddEdge("hello", "bye"))
  fmt.Println(go_graph)
  go_graph.AddNode("hello")
  go_graph.AddEdge("hello", "bye")
  fmt.Println(go_graph)
  go_graph.RemoveEdge("hello", "bye")
  fmt.Println(go_graph);
}
