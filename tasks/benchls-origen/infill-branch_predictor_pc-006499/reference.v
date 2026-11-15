module origen_006499 (
    input wire clk,
    input wire rst,
    input wire [31:0] btb_target,
    input wire [31:0] ras_target,
    input wire pc_go,
    input wire stall,
    input wire [31:0] good_target,
    input wire [1:0] id_pc_src,
    input wire btb_v,
    input wire [1:0] btb_type,
    output reg [31:0] pc_out,
    output reg v_pc_out,
    output wire [31:0] pc_plus4
);

    localparam INITIAL_PC = 32'h00040000;
    localparam BR_TYPE = 2'b00;
    localparam J_TYPE = 2'b01;
    localparam JAL_TYPE = 2'b10;
    localparam JR_TYPE = 2'b11;

    reg [31:0] next_pc;
    wire [1:0] pc_src;

    assign pc_plus4 = pc_out + 32'd4;

    // PC source selection
    assign pc_src = (btb_v && (btb_type == BR_TYPE || btb_type == J_TYPE || btb_type == JAL_TYPE)) ? 2'b11 :
                    (btb_v && btb_type == JR_TYPE) ? 2'b10 :
                    id_pc_src;

    // Next PC calculation
    always @(*) begin
        case (pc_src)
            2'b00: next_pc = good_target;
            2'b01: next_pc = pc_plus4;
            2'b10: next_pc = ras_target;
            2'b11: next_pc = btb_target;
        endcase
    end

    // PC update
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pc_out <= INITIAL_PC;
            v_pc_out <= 1'b1;
        end else if (pc_go && !stall) begin
            pc_out <= next_pc;
            v_pc_out <= 1'b1;
        end else begin
            v_pc_out <= 1'b0;
        end
    end

endmodule