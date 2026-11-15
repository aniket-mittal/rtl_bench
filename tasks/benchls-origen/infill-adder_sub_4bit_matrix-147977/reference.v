module origen_147977(
    input [3:0] A,
    input [3:0] B,
    input CTRL,
    output [3:0] OUT,
    output OVF
);
    wire [3:0] B_xor;
    wire [4:0] sum;
    
    assign B_xor = B ^ {4{CTRL}};
    assign sum = A + B_xor + CTRL;
    assign OUT = sum[3:0];
    assign OVF = (A[3] == B_xor[3] && OUT[3] != A[3]);
endmodule

module matrix_multiplier(
    input [127:0] A,
    input [127:0] B,
    output [127:0] C
);
    genvar i, j, k;
    generate
        for (i = 0; i < 4; i = i + 1) begin : row
            for (j = 0; j < 4; j = j + 1) begin : col
                wire [15:0] sum;
                assign sum = 16'b0;
                for (k = 0; k < 4; k = k + 1) begin : mult
                    assign sum = sum + A[i*32+k*8 +: 8] * B[k*32+j*8 +: 8];
                end
                assign C[i*32+j*8 +: 8] = sum[7:0];
            end
        end
    endgenerate
endmodule

module bitwise_or(
    input [3:0] adder_out,
    input [127:0] matrix_out,
    output [127:0] final_out
);
    assign final_out = {124'b0, adder_out} | matrix_out;
endmodule

module control_logic(
    input select_module,
    input select_output,
    input [3:0] adder_out,
    input [127:0] matrix_out,
    output [127:0] system_out
);
    wire [127:0] adder_extended;
    assign adder_extended = {124'b0, adder_out};
    
    assign system_out = select_module ? 
                        (select_output ? matrix_out : adder_extended) :
                        (select_output ? adder_extended : matrix_out);
endmodule

module combined_system(
    input [3:0] A_adder,
    input [3:0] B_adder,
    input CTRL_adder,
    input [127:0] A_matrix,
    input [127:0] B_matrix,
    input select_module,
    input select_output,
    output [127:0] system_out,
    output OVF
);
    wire [3:0] adder_out;
    wire [127:0] matrix_out;
    wire [127:0] or_out;
    
    adder_subtractor as(
        .A(A_adder),
        .B(B_adder),
        .CTRL(CTRL_adder),
        .OUT(adder_out),
        .OVF(OVF)
    );
    
    matrix_multiplier mm(
        .A(A_matrix),
        .B(B_matrix),
        .C(matrix_out)
    );
    
    bitwise_or bo(
        .adder_out(adder_out),
        .matrix_out(matrix_out),
        .final_out(or_out)
    );
    
    control_logic cl(
        .select_module(select_module),
        .select_output(select_output),
        .adder_out(adder_out),
        .matrix_out(matrix_out),
        .system_out(system_out)
    );
endmodule