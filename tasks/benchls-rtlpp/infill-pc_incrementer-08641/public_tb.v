// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08641 dut (
    .clk(clk),
    .cur_pc(in_vec[32:1]),
    .rst(in_vec[0:0]),
    .next_pc(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h189fdc1a5;
    stim[1] = 33'h0ddec9543;
    stim[2] = 33'h1e6d54a24;
    stim[3] = 33'h030aa2d40;
    stim[4] = 33'h1b91e80f4;
    stim[5] = 33'h02af14b58;
    stim[6] = 33'h0e4856a10;
    stim[7] = 33'h192572c00;
    stim[8] = 33'h0f8e70f6e;
    stim[9] = 33'h073114598;
    stim[10] = 33'h0edadf136;
    stim[11] = 33'h0cad5ff86;
    stim[12] = 33'h1935c8a38;
    stim[13] = 33'h0ad3ea31a;
    stim[14] = 33'h1dd2475ee;
    stim[15] = 33'h1037bc4da;
    stim[16] = 33'h10ae2d456;
    stim[17] = 33'h008b9b9ae;
    stim[18] = 33'h06af3927a;
    stim[19] = 33'h1b87b68bc;
    stim[20] = 33'h16f33c1de;
    stim[21] = 33'h099e8a3f6;
    stim[22] = 33'h18f91fc92;
    stim[23] = 33'h0f4af0ace;
    stim[24] = 33'h0998d4c20;
    stim[25] = 33'h15ae1187a;
    stim[26] = 33'h06ce91aee;
    stim[27] = 33'h01cec0444;
    stim[28] = 33'h00946eb56;
    stim[29] = 33'h0f3208136;
    stim[30] = 33'h04b915440;
    stim[31] = 33'h05162d254;
    stim[32] = 33'h022ba6e58;
    stim[33] = 33'h0734f1f1e;
    stim[34] = 33'h1a113be84;
    stim[35] = 33'h009cb2524;
    stim[36] = 33'h02b5ee870;
    stim[37] = 33'h0a08daa60;
    stim[38] = 33'h0d92a5d92;
    stim[39] = 33'h1344b722a;
    stim[40] = 33'h043300f52;
    stim[41] = 33'h1218d446c;
    stim[42] = 33'h0719c9bcc;
    stim[43] = 33'h0e92f1fd2;
    stim[44] = 33'h18d31b6a4;
    stim[45] = 33'h0dee323e0;
    stim[46] = 33'h075ea3d6a;
    stim[47] = 33'h0ac4f93c6;
    stim[48] = 33'h02c328c38;
    stim[49] = 33'h0efe7f1c8;
    stim[50] = 33'h10009db6e;
    stim[51] = 33'h16d293988;
    stim[52] = 33'h02ee2d5a0;
    stim[53] = 33'h0962e86d2;
    stim[54] = 33'h0d9db92a8;
    stim[55] = 33'h1c76d5ae4;
    stim[56] = 33'h065edbb80;
    stim[57] = 33'h1a64b3ba0;
    stim[58] = 33'h1876b1fec;
    stim[59] = 33'h189bb201a;
    stim[60] = 33'h168523ca0;
    stim[61] = 33'h00c34bdf8;
    stim[62] = 33'h19befeee8;
    stim[63] = 33'h0cc2c3c9a;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'hf36aa516;
      expv[4] = 32'h185516a4;
      expv[5] = 32'hdc8f407e;
      expv[6] = 32'h1578a5b0;
      expv[7] = 32'h7242b50c;
      expv[8] = 32'hc92b9604;
      expv[9] = 32'h7c7387bb;
      expv[10] = 32'h3988a2d0;
      expv[11] = 32'h76d6f89f;
      expv[12] = 32'h656affc7;
      expv[13] = 32'hc9ae4520;
      expv[14] = 32'h569f5191;
      expv[15] = 32'hee923afb;
      expv[16] = 32'h81bde271;
      expv[17] = 32'h85716a2f;
      expv[18] = 32'h045cdcdb;
      expv[19] = 32'h3579c941;
      expv[20] = 32'hdc3db462;
      expv[21] = 32'hb799e0f3;
      expv[22] = 32'h4cf451ff;
      expv[23] = 32'hc7c8fe4d;
      expv[24] = 32'h7a57856b;
      expv[25] = 32'h4cc6a614;
      expv[26] = 32'had708c41;
      expv[27] = 32'h36748d7b;
      expv[28] = 32'h0e760226;
      expv[29] = 32'h04a375af;
      expv[30] = 32'h7990409f;
      expv[31] = 32'h25c8aa24;
      expv[32] = 32'h28b1692e;
      expv[33] = 32'h115d3730;
      expv[34] = 32'h39a78f93;
      expv[35] = 32'hd089df46;
      expv[36] = 32'h04e59296;
      expv[37] = 32'h15af743c;
      expv[38] = 32'h5046d534;
      expv[39] = 32'h6c952ecd;
      expv[40] = 32'h9a25b919;
      expv[41] = 32'h219807ad;
      expv[42] = 32'h90c6a23a;
      expv[43] = 32'h38ce4dea;
      expv[44] = 32'h74978fed;
      expv[45] = 32'hc698db56;
      expv[46] = 32'h6f7191f4;
      expv[47] = 32'h3af51eb9;
      expv[48] = 32'h5627c9e7;
      expv[49] = 32'h16194620;
      expv[50] = 32'h77f3f8e8;
      expv[51] = 32'h8004edbb;
      expv[52] = 32'hb6949cc8;
      expv[53] = 32'h17716ad4;
      expv[54] = 32'h4b17436d;
      expv[55] = 32'h6cedc958;
      expv[56] = 32'he3b6ad76;
      expv[57] = 32'h32f6ddc4;
      expv[58] = 32'hd3259dd4;
      expv[59] = 32'hc3b58ffa;
      expv[60] = 32'hc4dd9011;
      expv[61] = 32'hb4291e54;
      expv[62] = 32'h061a5f00;
      expv[63] = 32'hcdf7f778;
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
