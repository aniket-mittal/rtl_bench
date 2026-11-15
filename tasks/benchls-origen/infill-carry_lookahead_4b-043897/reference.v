module origen_043897 #(parameter N = 4) (
    input cin,
    input [N-1:0] P,
    input [N-1:0] G,
    output [N-1:0] C,
    output GG,
    output PG
);

    // Parameter check
    initial begin
        if (N < 1 || N > 4) begin
            $error("Invalid parameter N. Must be between 1 and 4.");
            ;
        end
    end

    // Intermediate wires
    wire [2:0] c_int;
    wire [2:0] gg_int;

    // Carry generation
    assign C[0] = G[0] | (P[0] & cin);
    
    generate
        if (N > 1) assign c_int[0] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & cin);
        if (N > 2) assign c_int[1] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & cin);
        if (N > 3) assign c_int[2] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & cin);
    endgenerate

    // Assign carries based on N
    generate
        if (N > 1) assign C[1] = c_int[0];
        if (N > 2) assign C[2] = c_int[1];
        if (N > 3) assign C[3] = c_int[2];
    endgenerate

    // Group Generate calculation
    generate
        if (N == 1) assign GG = G[0];
        if (N == 2) assign GG = G[1] | (G[0] & P[1]);
        if (N == 3) begin
            assign gg_int[0] = G[1] | (G[0] & P[1]);
            assign GG = G[2] | (gg_int[0] & P[2]);
        end
        if (N == 4) begin
            assign gg_int[0] = G[1] | (G[0] & P[1]);
            assign gg_int[1] = G[2] | (gg_int[0] & P[2]);
            assign GG = G[3] | (gg_int[1] & P[3]);
        end
    endgenerate

    // Group Propagate calculation
    assign PG = &P;

endmodule