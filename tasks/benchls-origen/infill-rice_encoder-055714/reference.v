module origen_055714 (
    input wire iClock,
    input wire iReset,
    input wire iEnable,
    input wire iData,
    input wire [15:0] iBlockSize,
    input wire [3:0] iPredictorOrder,
    input wire [3:0] iPartitionOrder,
    output reg [31:0] oMSB,
    output reg [31:0] oLSB,
    output reg [3:0] oRiceParam,
    output reg oDone
);

    // State definitions
    localparam IDLE = 2'b00;
    localparam RICE_PARAMETER = 2'b01;
    localparam UNARY = 2'b10;
    localparam REMAINDER = 2'b11;

    reg [1:0] state, next_state;
    reg [31:0] sample_count, partition_sample_count;
    reg [15:0] partition_size;
    reg [3:0] rice_param;
    reg [31:0] msb_count, lsb_count;
    reg [3:0] rice_param_count;
    reg [31:0] remainder;

    always @(posedge iClock or posedge iReset) begin
        if (iReset) begin
            state <= IDLE;
            sample_count <= 0;
            partition_sample_count <= 0;
            partition_size <= 0;
            rice_param <= 0;
            msb_count <= 0;
            lsb_count <= 0;
            rice_param_count <= 0;
            remainder <= 0;
            oMSB <= 0;
            oLSB <= 0;
            oRiceParam <= 0;
            oDone <= 0;
        end else begin
            state <= next_state;
            
            case (state)
                IDLE: begin
                    if (iEnable) begin
                        partition_size <= iBlockSize >> iPartitionOrder;
                        next_state <= RICE_PARAMETER;
                    end
                end

                RICE_PARAMETER: begin
                    if (rice_param_count < 4) begin
                        rice_param <= (rice_param << 1) | iData;
                        rice_param_count <= rice_param_count + 1;
                    end else begin
                        oRiceParam <= rice_param;
                        rice_param_count <= 0;
                        next_state <= UNARY;
                    end
                end

                UNARY: begin
                    if (iData == 0) begin
                        msb_count <= msb_count + 1;
                    end else begin
                        oMSB <= msb_count;
                        if (rice_param == 0) begin
                            oDone <= 1;
                            next_state <= RICE_PARAMETER;
                            sample_count <= sample_count + 1;
                            partition_sample_count <= partition_sample_count + 1;
                            msb_count <= 0;
                        end else begin
                            next_state <= REMAINDER;
                        end
                    end
                end

                REMAINDER: begin
                    if (lsb_count < rice_param) begin
                        remainder <= (remainder << 1) | iData;
                        lsb_count <= lsb_count + 1;
                    end else begin
                        oLSB <= remainder;
                        oDone <= 1;
                        next_state <= RICE_PARAMETER;
                        sample_count <= sample_count + 1;
                        partition_sample_count <= partition_sample_count + 1;
                        msb_count <= 0;
                        lsb_count <= 0;
                        remainder <= 0;
                    end
                end
            endcase

            if (partition_sample_count == partition_size) begin
                partition_sample_count <= 0;
                next_state <= RICE_PARAMETER;
            end

            if (sample_count == iBlockSize) begin
                next_state <= IDLE;
                sample_count <= 0;
            end

            if (state != next_state) begin
                oDone <= 0;
            end
        end
    end

endmodule