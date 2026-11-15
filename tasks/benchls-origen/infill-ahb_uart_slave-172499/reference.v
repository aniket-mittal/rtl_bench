module origen_172499(
    input HCLK,
    input HRESETn,
    input HSEL,
    input [31:0] HADDR,
    input [1:0] HTRANS,
    input [2:0] HSIZE,
    input [3:0] HPROT,
    input HWRITE,
    input [31:0] HWDATA,
    input HREADY,
    input [7:0] UART_RX,
    input [0:0] state,

    output reg HREADYOUT,
    output reg [31:0] HRDATA,
    output HRESP,
    output reg tx_en,
    output reg [7:0] UART_TX
);

    reg [3:0] addr_reg;

    wire read_en = HSEL && (HTRANS == 2'b10) && !HWRITE && HREADY;
    wire write_en = HSEL && (HTRANS == 2'b10) && HWRITE && HREADY;

    always @(posedge HCLK or negedge HRESETn) begin
        if (!HRESETn) begin
            addr_reg <= 4'b0;
            tx_en <= 1'b0;
            UART_TX <= 8'b0;
            HREADYOUT <= 1'b1;
            HRDATA <= 32'b0;
        end else begin
            if (read_en) begin
                addr_reg <= HADDR[3:0];
                if (addr_reg == 4'b0000) begin
                    HRDATA <= {24'b0, UART_RX};
                end else if (addr_reg == 4'b0100) begin
                    HRDATA <= {31'b0, state};
                end else begin
                    HRDATA <= 32'b0;
                end
            end else if (write_en) begin
                addr_reg <= HADDR[3:0];
                tx_en <= 1'b1;
                UART_TX <= HWDATA[7:0];
            end
        end
    end

    assign HRESP = 1'b0;

endmodule