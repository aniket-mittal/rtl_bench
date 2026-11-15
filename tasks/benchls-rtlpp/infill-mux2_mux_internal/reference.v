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

    assign
        result = result_node,
        result_node = {((sel & w_data186w[1]) | ((~ sel) & w_data186w[0])), 
                      ((sel & w_data174w[1]) | ((~ sel) & w_data174w[0])), 
                      ((sel & w_data162w[1]) | ((~ sel) & w_data162w[0])), 
                      ((sel & w_data150w[1]) | ((~ sel) & w_data150w[0])), 
                      ((sel & w_data138w[1]) | ((~ sel) & w_data138w[0])), 
                      ((sel & w_data126w[1]) | ((~ sel) & w_data126w[0])), 
                      ((sel & w_data114w[1]) | ((~ sel) & w_data114w[0])), 
                      ((sel & w_data102w[1]) | ((~ sel) & w_data102w[0])), 
                      ((sel & w_data90w[1]) | ((~ sel) & w_data90w[0])), 
                      ((sel & w_data78w[1]) | ((~ sel) & w_data78w[0])), 
                      ((sel & w_data66w[1]) | ((~ sel) & w_data66w[0])), 
                      ((sel & w_data54w[1]) | ((~ sel) & w_data54w[0])), 
                      ((sel & w_data42w[1]) | ((~ sel) & w_data42w[0])), 
                      ((sel & w_data30w[1]) | ((~ sel) & w_data30w[0])), 
                      ((sel & w_data18w[1]) | ((~ sel) & w_data18w[0])), 
                      ((sel & w_data4w[1]) | ((~ sel) & w_data4w[0]))},
        sel_node = sel,
        w_data102w = {data[24], data[8]},
        w_data114w = {data[25], data[9]},
        w_data126w = {data[26], data[10]},
        w_data138w = {data[27], data[11]},
        w_data150w = {data[28], data[12]},
        w_data162w = {data[29], data[13]},
        w_data174w = {data[30], data[14]},
        w_data186w = {data[31], data[15]},
        w_data18w = {data[17], data[1]},
        w_data30w = {data[18], data[2]},
        w_data42w = {data[19], data[3]},
        w_data4w = {data[16], data[0]},
        w_data54w = {data[20], data[4]},
        w_data66w = {data[21], data[5]},
        w_data78w = {data[22], data[6]},
        w_data90w = {data[23], data[7]};
endmodule