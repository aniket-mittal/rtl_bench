module origen_202408 (
    input RESET_n,
    input CLOCK_50MHz,
    input [1:0] ADC_OUT,
    output reg ADC_CNVST,
    output reg ADC_CS_N,
    output reg ADC_REFSEL,
    output reg ADC_SCLK,
    output reg ADC_SD,
    output reg ADC_UB,
    output reg ADC_SEL,
    output reg BUSY,
    output reg [7:0] DATA_AD0,
    output reg [7:0] DATA_AD1
);

    reg [11:0] data0, data1;
    reg [3:0] state;
    reg [3:0] count;
    parameter IDLE = 4'd0, START_CONV = 4'd1, WAIT_CONV = 4'd2, READ_DATA0 = 4'd3, READ_DATA1 = 4'd4, DONE = 4'd5;

    always @(posedge CLOCK_50MHz or negedge RESET_n) begin
        if (!RESET_n) begin
            state <= IDLE;
            ADC_CNVST <= 1'b0;
            ADC_CS_N <= 1'b1;
            ADC_REFSEL <= 1'b0;
            ADC_SCLK <= 1'b0;
            ADC_SD <= 1'b0;
            ADC_UB <= 1'b1;
            ADC_SEL <= 1'b0;
            BUSY <= 1'b0;
            data0 <= 12'b0;
            data1 <= 12'b0;
            count <= 4'b0;
        end
        else begin
            case (state)
                IDLE: begin
                    if (ADC_CNVST) begin
                        state <= START_CONV;
                        ADC_CNVST <= 1'b0;
                        ADC_CS_N <= 1'b0;
                        BUSY <= 1'b1;
                    end
                end
                START_CONV: begin
                    ADC_CNVST <= 1'b1;
                    state <= WAIT_CONV;
                    count <= 4'b0;
                end
                WAIT_CONV: begin
                    if (count == 4'd15) begin
                        state <= READ_DATA0;
                        count <= 4'b0;
                        ADC_SCLK <= 1'b0;
                    end
                    else begin
                        count <= count + 1;
                    end
                end
                READ_DATA0: begin
                    if (count == 4'd11) begin
                        state <= READ_DATA1;
                        count <= 4'b0;
                        data0 <= {data0[10:0], ADC_OUT[0]};
                    end
                    else begin
                        ADC_SCLK <= ~ADC_SCLK;
                        data0 <= {data0[10:0], ADC_OUT[0]};
                        count <= count + 1;
                    end
                end
                READ_DATA1: begin
                    if (count == 4'd11) begin
                        state <= DONE;
                        count <= 4'b0;
                        data1 <= {data1[10:0], ADC_OUT[1]};
                        DATA_AD0 <= data0[11:4];
                        DATA_AD1 <= data1[11:4];
                    end
                    else begin
                        ADC_SCLK <= ~ADC_SCLK;
                        data1 <= {data1[10:0], ADC_OUT[1]};
                        count <= count + 1;
                    end
                end
                DONE: begin
                    ADC_CNVST <= 1'b1;
                    ADC_CS_N <= 1'b1;
                    BUSY <= 1'b0;
                    state <= IDLE;
                end
            endcase
        end
    end

endmodule