module origen_052480 (
    input wire clk,
    input wire rst_n,
    input wire [4:0] RSaddr_i,
    input wire [4:0] RTaddr_i,
    input wire [4:0] RDaddr_i,
    input wire [31:0] RDdata_i,
    input wire [63:0] RDdata_D_i,
    input wire Fcond_i,
    input wire [1:0] RegWrite_i,
    input wire FPcondWrite,
    output wire [31:0] RSdata_o,
    output wire [31:0] RTdata_o,
    output wire [63:0] RSdata_D_o,
    output wire [63:0] RTdata_D_o,
    output wire Fcond_o
);

    reg [31:0] register [0:31];
    reg Fcond;

    // Read operations
    assign RSdata_o = register[RSaddr_i];
    assign RTdata_o = register[RTaddr_i];
    assign RSdata_D_o = {register[RSaddr_i+1], register[RSaddr_i]};
    assign RTdata_D_o = {register[RTaddr_i+1], register[RTaddr_i]};
    assign Fcond_o = Fcond;

    integer i;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (i = 0; i < 32; i = i + 1) begin
                register[i] <= 32'b0;
            end
            Fcond <= 1'b0;
        end else begin
            // Write operations
            case (RegWrite_i)
                2'b01: register[RDaddr_i] <= RDdata_i;
                2'b10: begin
                    register[RDaddr_i] <= RDdata_D_i[31:0];
                    register[RDaddr_i+1] <= RDdata_D_i[63:32];
                end
                default: ; // No write operation
            endcase

            // Update Fcond
            if (FPcondWrite) begin
                Fcond <= Fcond_i;
            end
        end
    end

endmodule