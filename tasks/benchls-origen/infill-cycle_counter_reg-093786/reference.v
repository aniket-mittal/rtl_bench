module origen_093786 (
    input wire clk,
    input wire reset,
    input wire cs,
    input wire read,
    input wire write,
    input wire [4:0] addr,
    input wire [31:0] wr_data,
    output reg [31:0] rd_data
);

    reg [47:0] count_reg;
    reg ctrl_reg;
    wire wr_en;
    wire clear;
    wire go;

    // Control signals
    assign wr_en = write && cs && (addr[1:0] == 2'b10);
    assign clear = wr_en && wr_data[1];
    assign go = ctrl_reg;

    // Counter logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count_reg <= 48'b0;
        end else if (clear) begin
            count_reg <= 48'b0;
        end else if (go) begin
            count_reg <= count_reg + 1'b1;
        end
    end

    // Control register logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            ctrl_reg <= 1'b0;
        end else if (wr_en) begin
            ctrl_reg <= wr_data[0];
        end
    end

    // Read logic
    always @(*) begin
        if (read && cs) begin
            if (addr[0] == 1'b0) begin
                rd_data = count_reg[31:0];
            end else begin
                rd_data = {16'b0, count_reg[47:32]};
            end
        end else begin
            rd_data = 32'b0;
        end
    end

endmodule