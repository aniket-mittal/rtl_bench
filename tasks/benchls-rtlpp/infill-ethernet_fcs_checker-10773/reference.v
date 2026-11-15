module rtlpp_10773
(
    input  wire        clk,
    input  wire        rst,
    input  wire [7:0]  input_axis_tdata,
    input  wire        input_axis_tvalid,
    output wire        input_axis_tready,
    input  wire        input_axis_tlast,
    input  wire        input_axis_tuser,
    output wire [7:0]  output_axis_tdata,
    output wire        output_axis_tvalid,
    input  wire        output_axis_tready,
    output wire        output_axis_tlast,
    output wire        output_axis_tuser,
    output wire        busy,
    output wire        error_bad_fcs
);

localparam [1:0]
    STATE_IDLE = 2'd0,
    STATE_PAYLOAD = 2'd1;

reg [1:0] state_reg = STATE_IDLE, state_next;
reg reset_crc;
reg update_crc;
reg shift_in;
reg shift_reset;
reg [7:0] input_axis_tdata_d0 = 8'd0;
reg [7:0] input_axis_tdata_d1 = 8'd0;
reg [7:0] input_axis_tdata_d2 = 8'd0;
reg [7:0] input_axis_tdata_d3 = 8'd0;
reg input_axis_tvalid_d0 = 1'b0;
reg input_axis_tvalid_d1 = 1'b0;
reg input_axis_tvalid_d2 = 1'b0;
reg input_axis_tvalid_d3 = 1'b0;
reg busy_reg = 1'b0;
reg error_bad_fcs_reg = 1'b0, error_bad_fcs_next;
reg input_axis_tready_reg = 1'b0, input_axis_tready_next;
reg [31:0] crc_state = 32'hFFFFFFFF;
wire [31:0] crc_next;
reg [7:0] output_axis_tdata_int;
reg       output_axis_tvalid_int;
reg       output_axis_tready_int_reg = 1'b0;
reg       output_axis_tlast_int;
reg       output_axis_tuser_int;
wire      output_axis_tready_int_early;

assign input_axis_tready = input_axis_tready_reg;
assign busy = busy_reg;
assign error_bad_fcs = error_bad_fcs_reg;

always @* begin
    state_next = STATE_IDLE;
    reset_crc = 1'b0;
    update_crc = 1'b0;
    shift_in = 1'b0;
    shift_reset = 1'b0;
    input_axis_tready_next = 1'b0;
    output_axis_tdata_int = 8'd0;
    output_axis_tvalid_int = 1'b0;
    output_axis_tlast_int = 1'b0;
    output_axis_tuser_int = 1'b0;
    error_bad_fcs_next = 1'b0;

    case (state_reg)
        STATE_IDLE: begin
            input_axis_tready_next = output_axis_tready_int_early;
            reset_crc = 1'b1;
            output_axis_tdata_int = input_axis_tdata_d3;
            output_axis_tvalid_int = input_axis_tvalid_d3 & input_axis_tvalid;
            output_axis_tlast_int = 1'b0;
            output_axis_tuser_int = 1'b0;

            if (input_axis_tready & input_axis_tvalid) begin
                shift_in = 1'b1;
                if (input_axis_tvalid_d3) begin
                    reset_crc = 1'b0;
                    update_crc = 1'b1;
                    if (input_axis_tlast) begin
                        shift_reset = 1'b1;
                        reset_crc = 1'b1;
                        output_axis_tlast_int = 1'b1;
                        output_axis_tuser_int = input_axis_tuser;
                        if ({input_axis_tdata, input_axis_tdata_d0, input_axis_tdata_d1, input_axis_tdata_d2} != ~crc_next) begin
                            output_axis_tuser_int = 1'b1;
                            error_bad_fcs_next = 1'b1;
                        end
                        input_axis_tready_next = output_axis_tready_int_early;
                        state_next = STATE_IDLE;
                    end else begin
                        state_next = STATE_PAYLOAD;
                    end
                end else begin
                    state_next = STATE_IDLE;
                end
            end else begin
                state_next = STATE_IDLE;
            end
        end
        STATE_PAYLOAD: begin
            input_axis_tready_next = output_axis_tready_int_early;
            output_axis_tdata_int = input_axis_tdata_d3;
            output_axis_tvalid_int = input_axis_tvalid_d3 & input_axis_tvalid;
            output_axis_tlast_int = 1'b0;
            output_axis_tuser_int = 1'b0;

            if (input_axis_tready & input_axis_tvalid) begin
                shift_in = 1'b1;
                update_crc = 1'b1;
                if (input_axis_tlast) begin
                    shift_reset = 1'b1;
                    reset_crc = 1'b1;
                    output_axis_tlast_int = 1'b1;
                    output_axis_tuser_int = input_axis_tuser;
                    if ({input_axis_tdata, input_axis_tdata_d0, input_axis_tdata_d1, input_axis_tdata_d2} != ~crc_next) begin
                        output_axis_tuser_int = 1'b1;
                        error_bad_fcs_next = 1'b1;
                    end
                    input_axis_tready_next = output_axis_tready_int_early;
                    state_next = STATE_IDLE;
                end else begin
                    state_next = STATE_PAYLOAD;
                end
            end else begin
                state_next = STATE_PAYLOAD;
            end
        end
    endcase
end

always @(posedge clk) begin
    if (rst) begin
        state_reg <= STATE_IDLE;
        input_axis_tready_reg <= 1'b0;
        busy_reg <= 1'b0;
        error_bad_fcs_reg <= 1'b0;
        input_axis_tvalid_d0 <= 1'b0;
        input_axis_tvalid_d1 <= 1'b0;
        input_axis_tvalid_d2 <= 1'b0;
        input_axis_tvalid_d3 <= 1'b0;
        crc_state <= 32'hFFFFFFFF;
    end else begin
        state_reg <= state_next;
        input_axis_tready_reg <= input_axis_tready_next;
        busy_reg <= state_next != STATE_IDLE;
        error_bad_fcs_reg <= error_bad_fcs_next;

        if (reset_crc) begin
            crc_state <= 32'hFFFFFFFF;
        end else if (update_crc) begin
            crc_state <= crc_next;
        end

        if (shift_reset) begin
            input_axis_tvalid_d0 <= 1'b0;
            input_axis_tvalid_d1 <= 1'b0;
            input_axis_tvalid_d2 <= 1'b0;
            input_axis_tvalid_d3 <= 1'b0;
        end else if (shift_in) begin
            input_axis_tvalid_d0 <= input_axis_tvalid;
            input_axis_tvalid_d1 <= input_axis_tvalid_d0;
            input_axis_tvalid_d2 <= input_axis_tvalid_d1;
            input_axis_tvalid_d3 <= input_axis_tvalid_d2;
        end
    end

    if (shift_in) begin
        input_axis_tdata_d0 <= input_axis_tdata;
        input_axis_tdata_d1 <= input_axis_tdata_d0;
        input_axis_tdata_d2 <= input_axis_tdata_d1;
        input_axis_tdata_d3 <= input_axis_tdata_d2;
    end
end

reg [7:0] output_axis_tdata_reg = 8'd0;
reg       output_axis_tvalid_reg = 1'b0, output_axis_tvalid_next;
reg       output_axis_tlast_reg = 1'b0;
reg       output_axis_tuser_reg = 1'b0;
reg [7:0] temp_axis_tdata_reg = 8'd0;
reg       temp_axis_tvalid_reg = 1'b0, temp_axis_tvalid_next;
reg       temp_axis_tlast_reg = 1'b0;
reg       temp_axis_tuser_reg = 1'b0;
reg store_axis_int_to_output;
reg store_axis_int_to_temp;
reg store_axis_temp_to_output;

assign output_axis_tdata = output_axis_tdata_reg;
assign output_axis_tvalid = output_axis_tvalid_reg;
assign output_axis_tlast = output_axis_tlast_reg;
assign output_axis_tuser = output_axis_tuser_reg;
assign output_axis_tready_int_early = output_axis_tready | (~temp_axis_tvalid_reg & (~output_axis_tvalid_reg | ~output_axis_tvalid_int));

always @* begin
    output_axis_tvalid_next = output_axis_tvalid_reg;
    temp_axis_tvalid_next = temp_axis_tvalid_reg;

    store_axis_int_to_output = 1'b0;
    store_axis_int_to_temp = 1'b0;
    store_axis_temp_to_output = 1'b0;

    if (output_axis_tready_int_reg) begin
        if (output_axis_tready | ~output_axis_tvalid_reg) begin
            output_axis_tvalid_next = output_axis_tvalid_int;
            store_axis_int_to_output = 1'b1;
        end else begin
            temp_axis_tvalid_next = output_axis_tvalid_int;
            store_axis_int_to_temp = 1'b1;
        end
    end else if (output_axis_tready) begin
        output_axis_tvalid_next = temp_axis_tvalid_reg;
        temp_axis_tvalid_next = 1'b0;
        store_axis_temp_to_output = 1'b1;
    end
end

always @(posedge clk) begin
    if (rst) begin
        output_axis_tvalid_reg <= 1'b0;
        output_axis_tready_int_reg <= 1'b0;
        temp_axis_tvalid_reg <= 1'b0;
    end else begin
        output_axis_tvalid_reg <= output_axis_tvalid_next;
        output_axis_tready_int_reg <= output_axis_tready_int_early;
        temp_axis_tvalid_reg <= temp_axis_tvalid_next;
    end

    if (store_axis_int_to_output) begin
        output_axis_tdata_reg <= output_axis_tdata_int;
        output_axis_tlast_reg <= output_axis_tlast_int;
        output_axis_tuser_reg <= output_axis_tuser_int;
    end else if (store_axis_temp_to_output) begin
        output_axis_tdata_reg <= temp_axis_tdata_reg;
        output_axis_tlast_reg <= temp_axis_tlast_reg;
        output_axis_tuser_reg <= temp_axis_tuser_reg;
    end

    if (store_axis_int_to_temp) begin
        temp_axis_tdata_reg <= output_axis_tdata_int;
        temp_axis_tlast_reg <= output_axis_tlast_int;
        temp_axis_tuser_reg <= output_axis_tuser_int;
    end
end

// CRC calculation embedded logic
function [31:0] eth_crc_8;
    input [7:0] data_in;
    input [31:0] crc_state;
    reg [31:0] crc;
    reg [7:0] d;
    integer i;
    begin
        crc = crc_state;
        d = data_in;

        for (i = 0; i < 8; i = i + 1) begin
            if ((crc[31] ^ d[7]) == 1) begin
                crc = {crc[30:0], 1'b0} ^ 32'h04C11DB7;
            end else begin
                crc = {crc[30:0], 1'b0};
            end
            d = {d[6:0], 1'b0};
        end

        eth_crc_8 = crc;
    end
endfunction

assign crc_next = eth_crc_8(input_axis_tdata_d3, crc_state);

endmodule