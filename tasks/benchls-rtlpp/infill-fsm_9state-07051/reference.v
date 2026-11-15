module rtlpp_07051 (
    input clk, rst, w,
    output reg z  
);

    parameter a = 4'b0000,
              b = 4'b0001,
              c = 4'b0010,
              d = 4'b0011,
              e = 4'b0100,
              f = 4'b0101,
              g = 4'b0110,
              h = 4'b0111,
              i = 4'b1000;

    reg [3:0] c_state, n_state;

    always @ (posedge clk or posedge rst) begin
        if (rst)
            c_state <= a;
        else
            c_state <= n_state;
    end

    always @ (*) begin
        case (c_state)
            a: 
                if (w)
                    n_state = f;
                else
                    n_state = b;
            b:
                if (w)
                    n_state = f;
                else
                    n_state = c;
            c:
                if (w)
                    n_state = f;
                else
                    n_state = d;
            d:
                if (w)
                    n_state = f;
                else
                    n_state = e;
            e:
                if (w)
                    n_state = f;
            f:
                if (w)
                    n_state = g;
                else
                    n_state = b;
            g: 
                if (w)
                    n_state = h;
                else
                    n_state = b;
            h:
                if (w)
                    n_state = i;
                else
                    n_state = b;
            i:
                if (!w)
                    n_state = b;
            default:
                n_state = a;
        endcase
    end

    always @ (posedge clk or posedge rst) begin
        if (rst)
            z <= 0;
        else
            z <= (c_state == i) || (c_state == e);
    end

endmodule