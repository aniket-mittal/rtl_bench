module rtlpp_07509
(
    clk,
    clk__enable,

    divider_control__write_config,
    divider_control__write_data,
    divider_control__start,
    divider_control__stop,
    divider_control__disable_fractional,
    reset_n,

    divider_output__config_data,
    divider_output__running,
    divider_output__clock_enable
);

    input clk;
    input clk__enable;

    input divider_control__write_config;
    input [31:0]divider_control__write_data;
    input divider_control__start;
    input divider_control__stop;
    input divider_control__disable_fractional;

    input reset_n;

    output [31:0]divider_output__config_data;
    output divider_output__running;
    output divider_output__clock_enable;

    reg [31:0]divider_output__config_data;
    reg divider_output__running;
    reg divider_output__clock_enable;

    reg [15:0]divider_state__adder;
    reg [14:0]divider_state__subtractor;
    reg [30:0]divider_state__accumulator;
    reg divider_state__fractional_mode;
    reg divider_state__running;
    reg divider_state__clock_enable;

    always @ ( * )
    begin : drive_outputs__comb_code
        reg [31:0]divider_output__config_data__var;
        divider_output__config_data__var = 32'h0;
        divider_output__config_data__var[15:0] = divider_state__adder;
        divider_output__config_data__var[30:16] = divider_state__subtractor;
        divider_output__config_data__var[31] = divider_state__fractional_mode;
        divider_output__config_data = divider_output__config_data__var;
        divider_output__running = divider_state__running;
        divider_output__clock_enable = divider_state__clock_enable;
    end

    always @(posedge clk or negedge reset_n)
    begin : configure__code
        if (reset_n == 1'b0)
        begin
            divider_state__adder <= 16'h0;
            divider_state__subtractor <= 15'h0;
            divider_state__fractional_mode <= 1'b0;
        end
        else if (clk__enable)
        begin
            if (divider_control__write_config)
            begin
                divider_state__adder <= divider_control__write_data[15:0];
                divider_state__subtractor <= divider_control__write_data[30:16];
                divider_state__fractional_mode <= divider_control__write_data[31];
            end
            if (divider_control__disable_fractional)
            begin
                divider_state__fractional_mode <= 1'b0;
            end
        end
    end

    always @(posedge clk or negedge reset_n)
    begin : fractional_divider__code
        if (reset_n == 1'b0)
        begin
            divider_state__clock_enable <= 1'b0;
            divider_state__running <= 1'b0;
            divider_state__accumulator <= 31'h0;
        end
        else if (clk__enable)
        begin
            if (divider_state__running)
            begin
                divider_state__clock_enable <= 1'b0;
                if (divider_control__stop)
                begin
                    divider_state__running <= 1'b0;
                end
                else
                begin
                    if (divider_state__fractional_mode)
                    begin
                        if (divider_state__accumulator[15])
                        begin
                            divider_state__accumulator[15:0] <= divider_state__accumulator[15:0] + divider_state__adder;
                            divider_state__clock_enable <= 1'b1;
                        end
                        else
                        begin
                            divider_state__accumulator[15:0] <= divider_state__accumulator[15:0] - {1'b0, divider_state__subtractor};
                        end
                    end
                    else
                    begin
                        if (divider_state__accumulator == 31'h0)
                        begin
                            divider_state__accumulator <= {divider_state__subtractor, divider_state__adder};
                            divider_state__clock_enable <= 1'b1;
                        end
                        else
                        begin
                            divider_state__accumulator <= divider_state__accumulator - 31'h1;
                        end
                    end
                end
            end
            if (divider_control__start)
            begin
                divider_state__running <= 1'b1;
                if (divider_state__fractional_mode)
                begin
                    divider_state__accumulator[15:0] <= divider_state__adder >> 1;
                end
                else
                begin
                    divider_state__accumulator <= {divider_state__subtractor, divider_state__adder};
                end
            end
        end
    end

endmodule