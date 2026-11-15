// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_089241 dut (
    .clock(clk),
    .reset(in_vec[66:66]),
    .DIVS(in_vec[65:65]),
    .dividend(in_vec[64:33]),
    .divisor(in_vec[32:1]),
    .start(in_vec[0:0]),
    .q(out_vec[65:34]),
    .r(out_vec[33:2]),
    .pause(out_vec[1:1]),
    .busy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h70e297d343b08eda0;
    stim[1] = 67'h6cc43b7297224169c;
    stim[2] = 67'h08ef391149162f589;
    stim[3] = 67'h2612a194e86f8a53d;
    stim[4] = 67'h01d48f773baf9543b;
    stim[5] = 67'h1abcc65537b74264b;
    stim[6] = 67'h2736979493fce1132;
    stim[7] = 67'h2d9dd0070295c1e56;
    stim[8] = 67'h09e7f6a7ce7ba5f8e;
    stim[9] = 67'h2968c19ce38ae412e;
    stim[10] = 67'h2f758c4a55f9cf5b7;
    stim[11] = 67'h10146cd26c274be58;
    stim[12] = 67'h19d6486c4a76e887c;
    stim[13] = 67'h189717f17bb9cbeeb;
    stim[14] = 67'h1e53099b2146b932c;
    stim[15] = 67'h134cfea13249606a1;
    stim[16] = 67'h2ffa5141d75b1e587;
    stim[17] = 67'h3b455f90dd830b5dd;
    stim[18] = 67'h04ffa945033491bc4;
    stim[19] = 67'h19349282ae1989c20;
    stim[20] = 67'h362f601bb36252737;
    stim[21] = 67'h66105cc722ebf5a34;
    stim[22] = 67'h2ecf696275aedb136;
    stim[23] = 67'h2d3272c95cc2652b8;
    stim[24] = 67'h19e6464db13e9540c;
    stim[25] = 67'h352019c531bf218e2;
    stim[26] = 67'h52d80da50dc813466;
    stim[27] = 67'h1b4697c9d0cd6b74c;
    stim[28] = 67'h3025fb61d5098cf2a;
    stim[29] = 67'h2aa44b6c0b9bf3dda;
    stim[30] = 67'h041a7f11e51206ca3;
    stim[31] = 67'h24cce3ab0cdc9de21;
    stim[32] = 67'h3c69dbebb382ba434;
    stim[33] = 67'h0947262e926fec51e;
    stim[34] = 67'h3834272bd29e994f5;
    stim[35] = 67'h2ef548c69bdde9467;
    stim[36] = 67'h2ca2f6f51e9e30c56;
    stim[37] = 67'h1361f0e3059eab696;
    stim[38] = 67'h0bede8847dcf912ef;
    stim[39] = 67'h36636194292284733;
    stim[40] = 67'h343e23f7b5a36e95b;
    stim[41] = 67'h140304dc4bc226aae;
    stim[42] = 67'h068536d2cc4ab6dc8;
    stim[43] = 67'h2bd6a28a5f890c600;
    stim[44] = 67'h182ee135d90bb41b0;
    stim[45] = 67'h1b401cce3d23d5b64;
    stim[46] = 67'h23b116918a64e306f;
    stim[47] = 67'h1a58da33d3c522757;
    stim[48] = 67'h02d4dda0e3930ac5a;
    stim[49] = 67'h1e4806a968a4a242c;
    stim[50] = 67'h0df55ad97d3fd6e8b;
    stim[51] = 67'h131bfdefd21021b38;
    stim[52] = 67'h3a7e31a766c28eebf;
    stim[53] = 67'h3f7895b89ae60e8a2;
    stim[54] = 67'h250847e301e366c93;
    stim[55] = 67'h2169bc794694f3600;
    stim[56] = 67'h384ab673540049a4d;
    stim[57] = 67'h37828360ccb8c29a8;
    stim[58] = 67'h0f18537083963246c;
    stim[59] = 67'h3dffc8368803792b3;
    stim[60] = 67'h3257e7321f3436faf;
    stim[61] = 67'h26ce8411d3e1ca6d8;
    stim[62] = 67'h324e5a9976bcbd2c2;
    stim[63] = 67'h3a7c6c542200f1403;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 66'h00000000000000000;
      expv[1] = 66'h00000000000000000;
      expv[2] = 66'h00000000000000000;
      expv[3] = 66'h00000000000000001;
      expv[4] = 66'h00000000400000001;
      expv[5] = 66'h00000000x00000001;
      expv[6] = 66'h00000001x00000001;
      expv[7] = 66'h0000000xx00000001;
      expv[8] = 66'h0000000xx00000001;
      expv[9] = 66'h0000000xx00000001;
      expv[10] = 66'h0000001xx00000001;
      expv[11] = 66'h000000xxx00000001;
      expv[12] = 66'h000000xxx00000001;
      expv[13] = 66'h000000xxx00000001;
      expv[14] = 66'h000001xxx00000001;
      expv[15] = 66'h00000xxxx00000001;
      expv[16] = 66'h00000xxxx00000001;
      expv[17] = 66'h00000xxxx00000001;
      expv[18] = 66'h00001xxxx00000001;
      expv[19] = 66'h0000xxxxx00000001;
      expv[20] = 66'h0000xxxxx00000001;
      expv[21] = 66'h00000000000000000;
      expv[22] = 66'h00000000000000000;
      expv[23] = 66'h00000000000000000;
      expv[24] = 66'h00000000000000000;
      expv[25] = 66'h00000000000000000;
      expv[26] = 66'h00000000000000000;
      expv[27] = 66'h00000000000000000;
      expv[28] = 66'h00000000000000000;
      expv[29] = 66'h00000000000000000;
      expv[30] = 66'h00000000000000000;
      expv[31] = 66'h00000000000000001;
      expv[32] = 66'h00000000400000001;
      expv[33] = 66'h00000000x00000001;
      expv[34] = 66'h00000001x00000001;
      expv[35] = 66'h0000000xx00000001;
      expv[36] = 66'h0000000xx00000001;
      expv[37] = 66'h0000000xx00000001;
      expv[38] = 66'h0000001xx00000001;
      expv[39] = 66'h000000xxx00000001;
      expv[40] = 66'h000000xxx00000001;
      expv[41] = 66'h000000xxx00000001;
      expv[42] = 66'h000001xxx00000001;
      expv[43] = 66'h00000xxxx00000001;
      expv[44] = 66'h00000xxxx00000001;
      expv[45] = 66'h00000xxxx00000001;
      expv[46] = 66'h00001xxxx00000001;
      expv[47] = 66'h0000xxxxx00000001;
      expv[48] = 66'h0000xxxxx00000001;
      expv[49] = 66'h0000xxxxx00000001;
      expv[50] = 66'h0001xxxxx00000001;
      expv[51] = 66'h000xxxxxx00000001;
      expv[52] = 66'h000xxxxxx00000001;
      expv[53] = 66'h000xxxxxx00000001;
      expv[54] = 66'h001xxxxxx00000001;
      expv[55] = 66'h00xxxxxxx00000001;
      expv[56] = 66'h00xxxxxxx00000001;
      expv[57] = 66'h00xxxxxxx00000001;
      expv[58] = 66'h01xxxxxxx00000001;
      expv[59] = 66'h0xxxxxxxx00000001;
      expv[60] = 66'h0xxxxxxxx00000001;
      expv[61] = 66'h0xxxxxxxx00000001;
      expv[62] = 66'h1xxxxxxxx00000001;
      expv[63] = 66'h1xxxxxxxx00000002;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
