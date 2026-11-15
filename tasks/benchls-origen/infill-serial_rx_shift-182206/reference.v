module origen_182206 (
    input Clk,
    input Rst_n,
    input RxEn,
    input Rx,
    input Tick,
    input [3:0] NBits,
    output reg RxDone,
    output reg [7:0] RxData
);

localparam IDLE = 1'b0, READ = 1'b1;
reg state;
reg [3:0] Bit;
reg [7:0] Read_data;

always @(posedge Clk or negedge Rst_n) begin
    if (~Rst_n) begin
        state <= IDLE;
        Bit <= 0;
        Read_data <= 0;
        RxDone <= 0;
        RxData <= 0;
    end else begin
        case (state)
            IDLE: begin
                if (RxEn) begin
                    if (~Rx) begin
                        state <= READ;
                        Bit <= 0;
                        Read_data <= 0;
                    end
                end
                RxDone <= 0;
            end
            READ: begin
                if (Tick) begin
                    Read_data[Bit] <= Rx;
                    Bit <= Bit + 1;
                    if (Bit == NBits - 1) begin
                        state <= IDLE;
                        RxDone <= 1;
                        RxData <= Read_data;
                    end
                end
            end
        endcase
    end
end

endmodule