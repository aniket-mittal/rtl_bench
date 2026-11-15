// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_188648 dut (
    .clk(clk),
    .r4008(in_vec[31:24]),
    .r4009(in_vec[23:16]),
    .r400a(in_vec[15:8]),
    .r400b(in_vec[7:0]),
    .vol(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hd48682ca;
    stim[1] = 32'hdc92407b;
    stim[2] = 32'h568470a5;
    stim[3] = 32'h5a183b79;
    stim[4] = 32'h03f30c6d;
    stim[5] = 32'hbde36b6f;
    stim[6] = 32'hc610f259;
    stim[7] = 32'hd3c6e4e7;
    stim[8] = 32'haf1d83b0;
    stim[9] = 32'h35575afb;
    stim[10] = 32'ha6641915;
    stim[11] = 32'hfdb28b51;
    stim[12] = 32'he2b1a78d;
    stim[13] = 32'h30f3c2fb;
    stim[14] = 32'h5333cc23;
    stim[15] = 32'h9d03fb10;
    stim[16] = 32'h3e54090f;
    stim[17] = 32'h78d48a22;
    stim[18] = 32'h6e7317f8;
    stim[19] = 32'ha9c70e63;
    stim[20] = 32'h05391ba6;
    stim[21] = 32'hb83cf60a;
    stim[22] = 32'habfc076b;
    stim[23] = 32'h7b4d59f9;
    stim[24] = 32'h60ba6769;
    stim[25] = 32'h37fb93b8;
    stim[26] = 32'h1f4528a5;
    stim[27] = 32'h76f59307;
    stim[28] = 32'h3dc3c4c1;
    stim[29] = 32'h2e4ba380;
    stim[30] = 32'h1d0abc39;
    stim[31] = 32'h470059d8;
    stim[32] = 32'haf3a3d41;
    stim[33] = 32'haf441955;
    stim[34] = 32'hd6dccde9;
    stim[35] = 32'hbfe99526;
    stim[36] = 32'h25e3a90b;
    stim[37] = 32'h613897d8;
    stim[38] = 32'h6529b59b;
    stim[39] = 32'h9151cea0;
    stim[40] = 32'he9c3aa97;
    stim[41] = 32'h5c3da3da;
    stim[42] = 32'hf21165e1;
    stim[43] = 32'hccbbab89;
    stim[44] = 32'hdda357f4;
    stim[45] = 32'h72b756a3;
    stim[46] = 32'h5546b05e;
    stim[47] = 32'h1e3d01c5;
    stim[48] = 32'h7a1f68ba;
    stim[49] = 32'h79fa2244;
    stim[50] = 32'hd24689f6;
    stim[51] = 32'h5532c3ea;
    stim[52] = 32'h5891bbc9;
    stim[53] = 32'h9c88f1dd;
    stim[54] = 32'h6cabb0e1;
    stim[55] = 32'hdefc20cf;
    stim[56] = 32'h92504891;
    stim[57] = 32'h80c982e1;
    stim[58] = 32'h5485e233;
    stim[59] = 32'hbb725365;
    stim[60] = 32'ha51f7e32;
    stim[61] = 32'h43e7dc42;
    stim[62] = 32'hc36edb39;
    stim[63] = 32'he7a3acb8;
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
      expv[0] = 4'hx;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'hx;
      expv[4] = 4'hx;
      expv[5] = 4'hx;
      expv[6] = 4'h0;
      expv[7] = 4'h0;
      expv[8] = 4'h0;
      expv[9] = 4'h0;
      expv[10] = 4'hx;
      expv[11] = 4'h0;
      expv[12] = 4'h0;
      expv[13] = 4'h0;
      expv[14] = 4'h1;
      expv[15] = 4'h2;
      expv[16] = 4'h0;
      expv[17] = 4'h1;
      expv[18] = 4'h2;
      expv[19] = 4'h3;
      expv[20] = 4'h0;
      expv[21] = 4'h1;
      expv[22] = 4'h0;
      expv[23] = 4'h0;
      expv[24] = 4'h1;
      expv[25] = 4'h2;
      expv[26] = 4'h3;
      expv[27] = 4'h4;
      expv[28] = 4'h5;
      expv[29] = 4'h6;
      expv[30] = 4'h7;
      expv[31] = 4'h8;
      expv[32] = 4'h9;
      expv[33] = 4'h0;
      expv[34] = 4'h0;
      expv[35] = 4'h0;
      expv[36] = 4'h0;
      expv[37] = 4'h1;
      expv[38] = 4'h2;
      expv[39] = 4'h3;
      expv[40] = 4'h0;
      expv[41] = 4'h0;
      expv[42] = 4'h1;
      expv[43] = 4'h0;
      expv[44] = 4'h0;
      expv[45] = 4'h0;
      expv[46] = 4'h1;
      expv[47] = 4'h2;
      expv[48] = 4'h3;
      expv[49] = 4'h4;
      expv[50] = 4'h5;
      expv[51] = 4'h0;
      expv[52] = 4'h1;
      expv[53] = 4'h2;
      expv[54] = 4'h0;
      expv[55] = 4'h1;
      expv[56] = 4'h0;
      expv[57] = 4'h0;
      expv[58] = 4'h0;
      expv[59] = 4'h1;
      expv[60] = 4'h0;
      expv[61] = 4'h0;
      expv[62] = 4'h1;
      expv[63] = 4'h0;
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
