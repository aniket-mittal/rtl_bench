module rtlpp_10644(
    input clk, reset, 
    input pc_ld, pc_sel, pc_inc, ir_ld, 
    input adr_sel, W_En, S_Sel, 
    input [15:0] D_in, 
    input [2:0] W_Adr, R_Adr, S_Adr, 
    input [3:0] Alu_Op, 
    output C, N, Z, 
    output [15:0] D_out, 
    output [15:0] ir_out, 
    output [15:0] address
    ); 

    // Internal wires
    wire [15:0] reg_out; 
    wire [15:0] pc_out; 
    wire [15:0] pc_mux; 
    wire [15:0] sign_extension;
    wire [15:0] jaddr;

    // Internal register declarations
    reg [15:0] ir_reg;
    reg [15:0] pc;
    reg [15:0] IDP_Regfile [7:0];
    
    // ALU result
    reg [15:0] ALU_result;
    
    // State flags
    reg carry, negative, zero;

    // Assign outputs
    assign ir_out = ir_reg;
    assign address = (adr_sel) ? reg_out : pc_out; 

    // Sign extension
    assign sign_extension = { {8{ir_out[7]}}, ir_out[7:0]};
    assign jaddr = pc_out + sign_extension;
    assign pc_mux = (pc_sel) ? D_out : jaddr;

    // PC logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            pc <= 16'b0;
        else if (pc_ld)
            pc <= pc_mux;
        else if (pc_inc)
            pc <= pc + 1;
    end
    assign pc_out = pc;

    // IR logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            ir_reg <= 16'b0;
        else if (ir_ld)
            ir_reg <= D_in;
    end

    // Register File in IDP
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            IDP_Regfile[0] <= 16'b0;
            IDP_Regfile[1] <= 16'b0;
            IDP_Regfile[2] <= 16'b0;
            IDP_Regfile[3] <= 16'b0;
            IDP_Regfile[4] <= 16'b0;
            IDP_Regfile[5] <= 16'b0;
            IDP_Regfile[6] <= 16'b0;
            IDP_Regfile[7] <= 16'b0;
        end else if (W_En) begin
            IDP_Regfile[W_Adr] <= D_in;
        end
    end

    // ALU Logic
    always @* begin
        case (Alu_Op)
            4'b0000: ALU_result = IDP_Regfile[R_Adr] + IDP_Regfile[S_Adr]; // ADD
            4'b0001: ALU_result = IDP_Regfile[R_Adr] - IDP_Regfile[S_Adr]; // SUB
            4'b0010: ALU_result = IDP_Regfile[R_Adr] & IDP_Regfile[S_Adr]; // AND
            4'b0011: ALU_result = IDP_Regfile[R_Adr] | IDP_Regfile[S_Adr]; // OR
            4'b0100: ALU_result = IDP_Regfile[R_Adr] ^ IDP_Regfile[S_Adr]; // XOR
            default: ALU_result = 16'b0;
        endcase
        carry = (ALU_result > 16'hFFFF) ? 1'b1 : 1'b0;
        negative = (ALU_result[15]) ? 1'b1 : 1'b0;
        zero = (ALU_result == 16'b0) ? 1'b1 : 1'b0;
    end

    assign D_out = ALU_result;
    assign C = carry;
    assign N = negative;
    assign Z = zero;

    // Register Output Selection
    assign reg_out = IDP_Regfile[S_Sel ? S_Adr : R_Adr];

endmodule