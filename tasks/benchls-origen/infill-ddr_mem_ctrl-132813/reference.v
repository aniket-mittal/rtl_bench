module origen_132813 (
    input wire clk,
    input wire rst,
    input wire [31:0] data_in,
    output reg [31:0] data_out,
    input wire [31:0] address,
    input wire enable,
    output reg rw_status,
    output reg data_valid
);

    // States
    localparam IDLE = 3'd0;
    localparam READ_REQ = 3'd1;
    localparam WRITE_REQ = 3'd2;
    localparam WAIT_READ = 3'd3;
    localparam WAIT_WRITE = 3'd4;

    reg [2:0] state, next_state;

    // MIG interface signals
    reg [27:0] app_addr;
    reg [2:0] app_cmd;
    reg app_en;
    wire app_rdy;
    reg [127:0] app_wdf_data;
    reg app_wdf_end;
    reg [15:0] app_wdf_mask;
    reg app_wdf_wren;
    wire app_rd_data_valid;
    wire [127:0] app_rd_data;
    wire app_sr_active;
    wire app_ref_ack;
    wire app_zq_ack;
    wire init_calib_complete;

    // Internal signals
    reg [31:0] data_buffer;
    reg [1:0] byte_counter;

    // MIG wrapper instantiation
    // Note: Commented out as the mig_wrap_wrapper module is not provided
    /*
    mig_wrap_wrapper mig_inst (
        .sys_clk_i(clk),
        .sys_rst(rst),
        .app_addr(app_addr),
        .app_cmd(app_cmd),
        .app_en(app_en),
        .app_rdy(app_rdy),
        .app_wdf_data(app_wdf_data),
        .app_wdf_end(app_wdf_end),
        .app_wdf_mask(app_wdf_mask),
        .app_wdf_wren(app_wdf_wren),
        .app_rd_data(app_rd_data),
        .app_rd_data_valid(app_rd_data_valid),
        .app_sr_active(app_sr_active),
        .app_ref_ack(app_ref_ack),
        .app_zq_ack(app_zq_ack),
        .init_calib_complete(init_calib_complete)
    );
    */

    // Temporary assignments for simulation purposes
    assign app_rdy = 1'b1;
    assign app_rd_data_valid = 1'b1;
    assign app_rd_data = {96'd0, data_in};
    assign init_calib_complete = 1'b1;

    // State machine
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        next_state = state;
        case (state)
            IDLE: begin
                if (enable && init_calib_complete) begin
                    next_state = (data_in[31] == 1'b1) ? READ_REQ : WRITE_REQ;
                end
            end
            READ_REQ: begin
                if (app_rdy) begin
                    next_state = WAIT_READ;
                end
            end
            WRITE_REQ: begin
                if (app_rdy) begin
                    next_state = WAIT_WRITE;
                end
            end
            WAIT_READ: begin
                if (app_rd_data_valid) begin
                    next_state = IDLE;
                end
            end
            WAIT_WRITE: begin
                if (byte_counter == 2'b11) begin
                    next_state = IDLE;
                end
            end
        endcase
    end

    // Output logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            app_addr <= 28'd0;
            app_cmd <= 3'b000;
            app_en <= 1'b0;
            app_wdf_data <= 128'd0;
            app_wdf_end <= 1'b0;
            app_wdf_mask <= 16'h0000;
            app_wdf_wren <= 1'b0;
            data_out <= 32'd0;
            rw_status <= 1'b0;
            data_valid <= 1'b0;
            data_buffer <= 32'd0;
            byte_counter <= 2'b00;
        end else begin
            case (state)
                IDLE: begin
                    app_en <= 1'b0;
                    app_wdf_end <= 1'b0;
                    app_wdf_wren <= 1'b0;
                    rw_status <= 1'b0;
                    data_valid <= 1'b0;
                    byte_counter <= 2'b00;
                end
                READ_REQ: begin
                    app_addr <= address[27:0];
                    app_cmd <= 3'b001; // Read command
                    app_en <= 1'b1;
                end
                WRITE_REQ: begin
                    app_addr <= address[27:0];
                    app_cmd <= 3'b000; // Write command
                    app_en <= 1'b1;
                    app_wdf_data <= {96'd0, data_in};
                    app_wdf_end <= 1'b1;
                    app_wdf_mask <= 16'h0000;
                    app_wdf_wren <= 1'b1;
                end
                WAIT_READ: begin
                    if (app_rd_data_valid) begin
                        data_out <= app_rd_data[31:0];
                        rw_status <= 1'b1;
                        data_valid <= 1'b1;
                    end
                end
                WAIT_WRITE: begin
                    app_wdf_end <= 1'b0;
                    app_wdf_wren <= 1'b0;
                    byte_counter <= byte_counter + 1;
                    if (byte_counter == 2'b11) begin
                        rw_status <= 1'b1;
                    end
                end
            endcase
        end
    end

endmodule