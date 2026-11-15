module origen_193412(
    input enable,
    input clk,
    input [7:0] addr_in,
    output reg csunmap,
    output reg csram1,
    output reg csram2,
    output reg csrom,
    output reg csio,
    output reg csgfx,
    output reg csctrl,
    output reg cspgtbl,
    output reg pas
);

    reg enable_r;

    always @(posedge clk) begin
        enable_r <= enable;
    end

    always @(*) begin
        case (addr_in[7:0])
            8'b00000000: begin
                csunmap = 1'b1;
                csram1 = 1'b0;
                csram2 = 1'b0;
                csrom = 1'b0;
                csio = 1'b0;
                csgfx = 1'b0;
                csctrl = 1'b0;
                cspgtbl = 1'b0;
            end
            8'b00000001: begin
                csunmap = 1'b0;
                csram1 = 1'b0;
                csram2 = 1'b0;
                csrom = 1'b0;
                csio = 1'b0;
                csgfx = 1'b0;
                csctrl = 1'b1;
                cspgtbl = 1'b0;
            end
            8'b00000010: begin
                csunmap = 1'b0;
                csram1 = 1'b0;
                csram2 = 1'b0;
                csrom = 1'b0;
                csio = 1'b0;
                csgfx = 1'b0;
                csctrl = 1'b0;
                cspgtbl = 1'b1;
            end
            8'b00000011: begin
                csunmap = 1'b0;
                csram1 = 1'b0;
                csram2 = 1'b0;
                csrom = 1'b0;
                csio = 1'b1;
                csgfx = 1'b0;
                csctrl = 1'b0;
                cspgtbl = 1'b0;
            end
            8'b001111xx: begin
                csunmap = 1'b0;
                csram1 = 1'b0;
                csram2 = 1'b0;
                csrom = 1'b0;
                csio = 1'b0;
                csgfx = 1'b1;
                csctrl = 1'b0;
                cspgtbl = 1'b0;
            end
            8'b01xxxxxx: begin
                csunmap = 1'b0;
                csram1 = 1'b0;
                csram2 = 1'b0;
                csrom = 1'b1;
                csio = 1'b0;
                csgfx = 1'b0;
                csctrl = 1'b0;
                cspgtbl = 1'b0;
            end
            8'b10xxxxxx: begin
                csunmap = 1'b0;
                csram1 = 1'b1;
                csram2 = 1'b0;
                csrom = 1'b0;
                csio = 1'b0;
                csgfx = 1'b0;
                csctrl = 1'b0;
                cspgtbl = 1'b0;
            end
            8'b11xxxxxx: begin
                csunmap = 1'b0;
                csram1 = 1'b0;
                csram2 = 1'b1;
                csrom = 1'b0;
                csio = 1'b0;
                csgfx = 1'b0;
                csctrl = 1'b0;
                cspgtbl = 1'b0;
            end
            default: begin
                csunmap = 1'b0;
                csram1 = 1'b0;
                csram2 = 1'b0;
                csrom = 1'b0;
                csio = 1'b0;
                csgfx = 1'b0;
                csctrl = 1'b0;
                cspgtbl = 1'b0;
            end
        endcase
    end

    assign pas = enable_r;
endmodule