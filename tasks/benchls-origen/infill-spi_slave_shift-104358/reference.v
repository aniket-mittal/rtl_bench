module origen_104358 (
    input wire clk,
    input wire SCK,
    input wire MOSI,
    output reg MISO,
    input wire SSEL,
    input wire [319:0] data_in,
    input wire toggle_out,
    output reg LED
);

    reg [2:0] SCKr;
    reg [1:0] MOSIr;
    reg [2:0] SSELr;
    reg [319:0] byte_data_sent;
    reg [8:0] cnt;

    wire SCK_risingedge = (SCKr[2:1] == 2'b01);
    wire SCK_fallingedge = (SCKr[2:1] == 2'b10);
    wire SSEL_active = ~SSELr[1];
    wire MOSI_data = MOSIr[1];

    always @(posedge clk) begin
        SCKr <= {SCKr[1:0], SCK};
        MOSIr <= {MOSIr[0], MOSI};
        SSELr <= {SSELr[1:0], SSEL};
    end

    always @(posedge clk) begin
        if (SSEL_active) begin
            if (SCK_fallingedge && toggle_out) begin
                byte_data_sent <= {byte_data_sent[318:0], 1'b0};
                cnt <= cnt + 1;
            end
        end else begin
            byte_data_sent <= data_in;
            cnt <= 0;
        end
    end

    always @(posedge clk) begin
        if (SSEL_active) begin
            if (SCK_fallingedge && toggle_out) begin
                MISO <= byte_data_sent[319];
            end
        end else begin
            MISO <= 1'b0;
        end
    end

    always @(posedge clk) begin
        LED <= ~SSEL_active;
    end

endmodule