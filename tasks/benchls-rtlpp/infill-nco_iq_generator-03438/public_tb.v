// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03438 dut (
    .clk(clk),
    .rstn(in_vec[30:30]),
    .tic_enable(in_vec[29:29]),
    .f_control(in_vec[28:0]),
    .carrier_val(out_vec[35:4]),
    .i_sign(out_vec[3:3]),
    .i_mag(out_vec[2:2]),
    .q_sign(out_vec[1:1]),
    .q_mag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h31d681c7;
    stim[1] = 31'h0aace392;
    stim[2] = 31'h447dcee8;
    stim[3] = 31'h5bec93e9;
    stim[4] = 31'h49839dc1;
    stim[5] = 31'h78f40077;
    stim[6] = 31'h6f4d11c0;
    stim[7] = 31'h49ac166d;
    stim[8] = 31'h544e2ed3;
    stim[9] = 31'h6a00e470;
    stim[10] = 31'h46be1f4f;
    stim[11] = 31'h5cdbcd52;
    stim[12] = 31'h673b95bb;
    stim[13] = 31'h5d3e3643;
    stim[14] = 31'h5adc8fa9;
    stim[15] = 31'h7fb3243f;
    stim[16] = 31'h5edebd94;
    stim[17] = 31'h66f96e2a;
    stim[18] = 31'h4b5b6113;
    stim[19] = 31'h5bfc0395;
    stim[20] = 31'h4a12ea38;
    stim[21] = 31'h4c1f17e7;
    stim[22] = 31'h4b91b67d;
    stim[23] = 31'h7cfc3eb7;
    stim[24] = 31'h48a8445c;
    stim[25] = 31'h51630bf0;
    stim[26] = 31'h525224fc;
    stim[27] = 31'h77f6dac4;
    stim[28] = 31'h40e5fa0e;
    stim[29] = 31'h6823e5e4;
    stim[30] = 31'h56a6fdf8;
    stim[31] = 31'h77e0cf5f;
    stim[32] = 31'h5871bfe8;
    stim[33] = 31'h798a3a19;
    stim[34] = 31'h60e660d9;
    stim[35] = 31'h50c54517;
    stim[36] = 31'h67ad5d22;
    stim[37] = 31'h7887dac6;
    stim[38] = 31'h5527d60f;
    stim[39] = 31'h4dcbeb70;
    stim[40] = 31'h7bf1fd21;
    stim[41] = 31'h7a4d0f22;
    stim[42] = 31'h6b99e39c;
    stim[43] = 31'h41886354;
    stim[44] = 31'h4fb977d0;
    stim[45] = 31'h6428e459;
    stim[46] = 31'h792dcccf;
    stim[47] = 31'h731249f4;
    stim[48] = 31'h4911555a;
    stim[49] = 31'h42a96dea;
    stim[50] = 31'h64e3d1c0;
    stim[51] = 31'h64f4a559;
    stim[52] = 31'h54337a52;
    stim[53] = 31'h675eb313;
    stim[54] = 31'h3d642583;
    stim[55] = 31'h47fab05a;
    stim[56] = 31'h6a8344c8;
    stim[57] = 31'h7efae173;
    stim[58] = 31'h54d02108;
    stim[59] = 31'h5e8fe338;
    stim[60] = 31'h6a8b851d;
    stim[61] = 31'h49bc59c4;
    stim[62] = 31'h76cbf6bb;
    stim[63] = 31'h5408896c;
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
      expv[0] = 36'hxxxxxxxxe;
      expv[1] = 36'hxxxxxxxxb;
      expv[2] = 36'hxxxxxxxxb;
      expv[3] = 36'hxxxxxxxx9;
      expv[4] = 36'hxxxxxxxx1;
      expv[5] = 36'hxxxxxxxx3;
      expv[6] = 36'h0000029ee;
      expv[7] = 36'h0000002ec;
      expv[8] = 36'h0000002e4;
      expv[9] = 36'h0000002e6;
      expv[10] = 36'h000003023;
      expv[11] = 36'h000003029;
      expv[12] = 36'h000003021;
      expv[13] = 36'h000005dc3;
      expv[14] = 36'h000005dc9;
      expv[15] = 36'h000005dc3;
      expv[16] = 36'h000005d1c;
      expv[17] = 36'h000005d19;
      expv[18] = 36'h000005ba4;
      expv[19] = 36'h000005bab;
      expv[20] = 36'h000005bac;
      expv[21] = 36'h000005ba9;
      expv[22] = 36'h000005ba1;
      expv[23] = 36'h000005bab;
      expv[24] = 36'h000006bce;
      expv[25] = 36'h000006bc9;
      expv[26] = 36'h000006bc6;
      expv[27] = 36'h000006bce;
      expv[28] = 36'h00000351e;
      expv[29] = 36'h00000351c;
      expv[30] = 36'h000000df4;
      expv[31] = 36'h000000dfb;
      expv[32] = 36'h000002cc9;
      expv[33] = 36'h000002cc6;
      expv[34] = 36'h000001d16;
      expv[35] = 36'h00000369b;
      expv[36] = 36'h00000369e;
      expv[37] = 36'h000004841;
      expv[38] = 36'h000000ff3;
      expv[39] = 36'h000000ffb;
      expv[40] = 36'h000000ff1;
      expv[41] = 36'h000004b73;
      expv[42] = 36'h00000276e;
      expv[43] = 36'h0000001be;
      expv[44] = 36'h0000001b9;
      expv[45] = 36'h0000001b9;
      expv[46] = 36'h000001e86;
      expv[47] = 36'h0000022be;
      expv[48] = 36'h000003bec;
      expv[49] = 36'h000003bec;
      expv[50] = 36'h000003be9;
      expv[51] = 36'h000001ab1;
      expv[52] = 36'h000001f96;
      expv[53] = 36'h000001f93;
      expv[54] = 36'h0000038b9;
      expv[55] = 36'h0000038bb;
      expv[56] = 36'h0000038be;
      expv[57] = 36'h0000007f4;
      expv[58] = 36'h00000127b;
      expv[59] = 36'h000001271;
      expv[60] = 36'h000001274;
      expv[61] = 36'h0000064d6;
      expv[62] = 36'h0000064de;
      expv[63] = 36'h000003929;
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
