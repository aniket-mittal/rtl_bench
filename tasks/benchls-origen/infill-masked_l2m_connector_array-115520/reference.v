module origen_115520 #(
    parameter W = 4,
    parameter BYTE_BIT = 8,
    parameter A = 32
) (
    input wire [W-1:0] MASK_IN,
    input wire [W*BYTE_BIT-1:0] DATA,
    output wire [W*BYTE_BIT-1:0] MEM,
    output wire [A-1:0] AOUT
);

    wire [W*BYTE_BIT-1:0] MEMS [W:0];
    wire [A-1:0] address_wires [W:0];

    assign MEMS[0] = {W*BYTE_BIT{1'b0}};
    assign address_wires[0] = {A{1'b0}};

    genvar i;
    generate
        for (i = 0; i < W; i = i + 1) begin : gen_masked_units
            masked_l2m_connector_unit #(
                .BYTE_BIT(BYTE_BIT),
                .A(A)
            ) masked_unit (
                .MASK(MASK_IN[i]),
                .DATA(DATA[i*BYTE_BIT +: BYTE_BIT]),
                .MEM_IN(MEMS[i]),
                .MEM_OUT(MEMS[i+1]),
                .AIN(address_wires[i]),
                .AOUT(address_wires[i+1])
            );
        end
    endgenerate

    assign MEM = MEMS[W];
    assign AOUT = address_wires[W];

endmodule

module masked_l2m_connector_unit #(
    parameter BYTE_BIT = 8,
    parameter A = 32
) (
    input wire MASK,
    input wire [BYTE_BIT-1:0] DATA,
    input wire [BYTE_BIT-1:0] MEM_IN,
    output wire [BYTE_BIT-1:0] MEM_OUT,
    input wire [A-1:0] AIN,
    output wire [A-1:0] AOUT
);

    wire [BYTE_BIT-1:0] shifted_data;
    assign shifted_data = DATA << (AIN * BYTE_BIT);

    assign MEM_OUT = MASK ? (MEM_IN | shifted_data) : MEM_IN;
    assign AOUT = AIN + (MASK ? 1'b1 : 1'b0);

endmodule