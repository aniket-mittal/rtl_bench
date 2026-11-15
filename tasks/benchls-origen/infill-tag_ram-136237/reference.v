module origen_136237 (
    input wire [31:0] tagram_data_b,
    input wire tagram_wren_b,
    input wire [7:0] tagram_address_b,
    input wire cst_one,
    input wire cst_zero,
    input wire [0:0] cst_std_logic_vector_type_one,
    output wire [31:0] tagram_q_b
);

    // Internal signals
    wire rden_b;
    wire aclr0;
    wire aclr1;
    wire addressstall_a;
    wire addressstall_b;
    wire byteena_a;
    wire byteena_b;
    wire clock1;
    wire clocken0;
    wire clocken1;
    wire [31:0] q_a;

    // Assign constant values to internal signals
    assign rden_b = cst_one;
    assign aclr0 = cst_zero;
    assign aclr1 = cst_zero;
    assign addressstall_a = cst_zero;
    assign addressstall_b = cst_zero;
    assign byteena_a = cst_std_logic_vector_type_one[0];
    assign byteena_b = cst_std_logic_vector_type_one[0];
    assign clock1 = cst_one;
    assign clocken0 = cst_one;
    assign clocken1 = cst_one;

    // Instantiate the RAM
    ram_block tag_ram (
        .portadatain(32'b0),
        .portaaddr(8'b0),
        .portawe(1'b0),
        .portare(1'b0),
        .portbdatain(tagram_data_b),
        .portbaddr(tagram_address_b),
        .portbwe(tagram_wren_b),
        .portbre(rden_b),
        .clk0(cst_one),
        .clk1(clock1),
        .ena0(clocken0),
        .ena1(clocken1),
        .ena2(1'b1),
        .ena3(1'b1),
        .clr0(aclr0),
        .clr1(aclr1),
        .portabyteenamasks(byteena_a),
        .portbbyteenamasks(byteena_b),
        .portaaddrstall(addressstall_a),
        .portbaddrstall(addressstall_b),
        .devclrn(1'b1),
        .devpor(1'b1),
        .portacontrol(1'b0),
        .portbcontrol(1'b0),
        .portadataout(q_a),
        .portbdataout(tagram_q_b)
    );

endmodule

module ram_block (
    input wire [31:0] portadatain,
    input wire [7:0] portaaddr,
    input wire portawe,
    input wire portare,
    input wire [31:0] portbdatain,
    input wire [7:0] portbaddr,
    input wire portbwe,
    input wire portbre,
    input wire clk0,
    input wire clk1,
    input wire ena0,
    input wire ena1,
    input wire ena2,
    input wire ena3,
    input wire clr0,
    input wire clr1,
    input wire portabyteenamasks,
    input wire portbbyteenamasks,
    input wire portaaddrstall,
    input wire portbaddrstall,
    input wire devclrn,
    input wire devpor,
    input wire portacontrol,
    input wire portbcontrol,
    output reg [31:0] portadataout,
    output reg [31:0] portbdataout
);

    // RAM implementation
    reg [31:0] mem [0:255];

    always @(posedge clk0) begin
        if (portawe) begin
            mem[portaaddr] <= portadatain;
        end
        if (portare) begin
            portadataout <= mem[portaaddr];
        end
    end

    always @(posedge clk1) begin
        if (portbwe) begin
            mem[portbaddr] <= portbdatain;
        end
        if (portbre) begin
            portbdataout <= mem[portbaddr];
        end
    end

endmodule