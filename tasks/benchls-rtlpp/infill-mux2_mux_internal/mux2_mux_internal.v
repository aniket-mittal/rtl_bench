module mux2_mux_internal (
    data,
    result,
    sel
);
    input   [31:0]  data;
    output  [15:0]  result;
    input           sel;

    wire  [15:0]  result_node;
    wire  [0:0]   sel_node;
    wire  [1:0]   w_data102w;
    wire  [1:0]   w_data114w;
    wire  [1:0]   w_data126w;
    wire  [1:0]   w_data138w;
    wire  [1:0]   w_data150w;
    wire  [1:0]   w_data162w;
    wire  [1:0]   w_data174w;
    wire  [1:0]   w_data186w;
    wire  [1:0]   w_data18w;
    wire  [1:0]   w_data30w;
    wire  [1:0]   w_data42w;
    wire  [1:0]   w_data4w;
    wire  [1:0]   w_data54w;
    wire  [1:0]   w_data66w;
    wire  [1:0]   w_data78w;
    wire  [1:0]   w_data90w;

    [MASKED]
endmodule