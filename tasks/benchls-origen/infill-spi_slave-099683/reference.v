module origen_099683 #(
    parameter ShiftRegWidth = 8,
    parameter CPOL = 0,
    parameter CPHA = 0
) (
    input wire sclk,
    input wire mosi,
    input wire negss,
    input wire [ShiftRegWidth-1:0] dIn,
    input wire write_en,
    output reg miso,
    output wire [ShiftRegWidth-1:0] dOut
);

    reg [ShiftRegWidth-1:0] shift_reg;
    wire sample_edge, setup_edge;

    assign dOut = shift_reg;

    generate
        if (CPOL == 0 && CPHA == 0) begin
            assign sample_edge = ~sclk;
            assign setup_edge = sclk;
        end else if (CPOL == 0 && CPHA == 1) begin
            assign sample_edge = sclk;
            assign setup_edge = ~sclk;
        end else if (CPOL == 1 && CPHA == 0) begin
            assign sample_edge = sclk;
            assign setup_edge = ~sclk;
        end else begin
            assign sample_edge = ~sclk;
            assign setup_edge = sclk;
        end
    endgenerate

    always @(posedge sample_edge or posedge negss) begin
        if (negss) begin
            shift_reg <= shift_reg;
        end else begin
            if (write_en) begin
                shift_reg <= dIn;
            end else begin
                shift_reg <= {shift_reg[ShiftRegWidth-2:0], mosi};
            end
        end
    end

    always @(posedge setup_edge or posedge negss) begin
        if (negss) begin
            miso <= shift_reg[ShiftRegWidth-1];
        end else begin
            miso <= shift_reg[ShiftRegWidth-1];
        end
    end

endmodule

module spi_adder_test (
    input wire sclk,
    input wire mosi,
    input wire negss,
    output wire miso
);

    wire [7:0] dOut;
    reg [7:0] dIn;
    reg write_en;
    reg [2:0] bit_counter;

    spi_controller #(
        .ShiftRegWidth(8),
        .CPOL(0),
        .CPHA(0)
    ) spi_ctrl (
        .sclk(sclk),
        .mosi(mosi),
        .negss(negss),
        .dIn(dIn),
        .write_en(write_en),
        .miso(miso),
        .dOut(dOut)
    );

    always @(negedge sclk or posedge negss) begin
        if (negss) begin
            bit_counter <= 3'b000;
        end else begin
            bit_counter <= bit_counter + 1'b1;
        end
    end

    always @(posedge negss) begin
        dIn <= dOut + 8'd25;
    end

    always @(*) begin
        write_en = (bit_counter == 3'b111);
    end

endmodule