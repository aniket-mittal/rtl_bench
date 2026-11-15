module origen_171383(
    input  wire        clk,
    input  wire        rst,
    input  wire        RxD,
    output reg  [7:0]  RxD_data,
    output reg         RxD_data_ready
);

    parameter ClkFrequency = 25000000;
    parameter Baud = 115200;
    
    localparam Baud8 = Baud * 8;
    localparam Baud8GeneratorInc = (ClkFrequency / Baud8);
    
    reg [15:0] Baud8GeneratorAcc;
    wire       Baud8Tick = Baud8GeneratorAcc[15];
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            Baud8GeneratorAcc <= 0;
        end else begin
            Baud8GeneratorAcc <= Baud8GeneratorAcc + Baud8GeneratorInc;
        end
    end
    
    reg [3:0] bit_spacing;
    wire      next_bit = Baud8Tick & (bit_spacing == 4'b0111);
    
    reg       RxD_delay;
    reg       RxD_start;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            RxD_delay <= 1'b1;
            RxD_start <= 1'b0;
        end else begin
            RxD_delay <= RxD;
            RxD_start <= ~RxD & RxD_delay;
        end
    end
    
    reg [3:0] state;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= 4'b0000;
            bit_spacing <= 0;
            RxD_data <= 0;
            RxD_data_ready <= 0;
        end else begin
            case (state)
                4'b0000: begin // Wait for start bit
                    if (RxD_start) begin
                        state <= 4'b1000;
                        bit_spacing <= 0;
                    end
                end
                4'b1000: begin // Sample start bit
                    if (next_bit) begin
                        if (~RxD) begin
                            state <= 4'b1001;
                            bit_spacing <= 0;
                        end else begin
                            state <= 4'b0000;
                        end
                    end else begin
                        bit_spacing <= bit_spacing + 1;
                    end
                end
                4'b1001: begin // Sample data bits
                    if (next_bit) begin
                        RxD_data <= {RxD, RxD_data[7:1]};
                        if (bit_spacing == 4'b1000) begin
                            state <= 4'b0001;
                            bit_spacing <= 0;
                        end else begin
                            bit_spacing <= bit_spacing + 1;
                        end
                    end else begin
                        bit_spacing <= bit_spacing + 1;
                    end
                end
                4'b0001: begin // Sample stop bit
                    if (next_bit) begin
                        if (RxD) begin
                            RxD_data_ready <= 1'b1;
                            state <= 4'b0000;
                        end else begin
                            state <= 4'b0000;
                        end
                    end else begin
                        bit_spacing <= bit_spacing + 1;
                    end
                end
            endcase
        end
    end
    
endmodule