module rtlpp_01120(
    input [63:0]        in,
    input [1:0]         precision,
    input               en,
    output reg          sign,
    output reg [10:0]   exp,
    output reg [52:0]   mantissa,
    output reg          is_zero,
    output reg          is_norm,
    output reg          is_inf,
    output reg          is_NaN    
    );

    // Parameter definitions
    parameter   DBIAS    =   1023;
    parameter   SBIAS    =   127;
    parameter   HBIAS    =   15;

    // Internal signal definitions
    reg is_mantissa_nzdp, is_mantissa_nzsp, is_mantissa_nzhp;  
    reg is_exp_nzdp, is_exp_nzsp, is_exp_nzhp;                 
    reg is_exp_mdp, is_exp_msp, is_exp_mhp;                    
    reg [63:0] data;

    always @(*) begin
        // Load data based on enable signal
        data = en ? in : 64'b0;
        
        // Determine the sign bit based on precision
        sign = (precision == 2'b01) ? data[15] : 
               (precision == 2'b10) ? data[31] : 
               data[63];

        // Extract exponent based on precision
        exp = (precision == 2'b01) ? {6'b0, data[14:10]} : 
              (precision == 2'b10) ? {3'b0, data[30:23]} : 
              data[62:52];

        // Check if mantissa and exponent bits are non-zero
        is_mantissa_nzdp = |data[51:0];
        is_mantissa_nzsp = |data[22:0];
        is_mantissa_nzhp = |data[9:0];
        is_exp_nzdp = |data[62:52];
        is_exp_nzsp = |data[30:23];
        is_exp_nzhp = |data[14:10];

        // Determine if the value is zero based on precision
        is_zero = (precision == 2'b01) ? ~(is_exp_nzhp || is_mantissa_nzhp) : 
                  (precision == 2'b10) ? ~(is_exp_nzsp || is_mantissa_nzsp) : 
                  ~(is_exp_nzdp || is_mantissa_nzdp);

        // Check for maximum exponent values based on precision
        is_exp_mdp = exp[10:0] == 11'd2047;
        is_exp_msp = exp[7:0] == 8'd255;
        is_exp_mhp = exp[4:0] == 5'd31;

        // Determine if NaN based on precision
        is_NaN = (precision == 2'b01) ? is_exp_mhp && is_mantissa_nzhp : 
                 (precision == 2'b10) ? is_exp_msp && is_mantissa_nzsp : 
                 is_exp_mdp && is_mantissa_nzdp;

        // Determine if infinity based on precision
        is_inf = (precision == 2'b01) ? is_exp_mhp && ~is_mantissa_nzhp : 
                 (precision == 2'b10) ? is_exp_msp && ~is_mantissa_nzsp : 
                 is_exp_mdp && ~is_mantissa_nzdp;

        // Determine if normalized based on precision
        is_norm = (precision == 2'b01) ? is_exp_nzhp : 
                  (precision == 2'b10) ? is_exp_nzsp : 
                  is_exp_nzdp;

        // Calculate mantissa and adjust exponent if normalized
        if(is_norm) begin
            mantissa = {1'b1, (precision == 2'b01) ? {data[9:0], 42'b0} : 
                              (precision == 2'b10) ? {data[22:0], 29'b0} : 
                              data[51:0]};
        end else begin
            mantissa = {1'b0, 52'b0};
            exp = 11'b0;
        end
    end
endmodule