// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01989 dut (
    .clk(clk),
    .a(in_vec[65:34]),
    .b(in_vec[33:2]),
    .ce(in_vec[1:1]),
    .clr(in_vec[0:0]),
    .op(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h1d257b7553b615f56;
    stim[1] = 66'h2c7b966cb6c001ffd;
    stim[2] = 66'h13fd5a59261ab1ad3;
    stim[3] = 66'h045cdc26c07b79b6f;
    stim[4] = 66'h097dc09ae576abf9a;
    stim[5] = 66'h19fb12ea12e106282;
    stim[6] = 66'h0800caa80c099922b;
    stim[7] = 66'h1e2d4c3f3c59bac9b;
    stim[8] = 66'h309ac488dc65d40bc;
    stim[9] = 66'h21492ceebc54044a8;
    stim[10] = 66'h3aeff2f03ba2ade58;
    stim[11] = 66'h318db2297f7d465a3;
    stim[12] = 66'h1e7f7af23ac21c63e;
    stim[13] = 66'h24458b60c04acc140;
    stim[14] = 66'h0a969b78532776ee4;
    stim[15] = 66'h1284f99480d089752;
    stim[16] = 66'h0ce70994854dfb37a;
    stim[17] = 66'h3c5016c72c971ac40;
    stim[18] = 66'h094272a08c2a42d4f;
    stim[19] = 66'h247061f7f0d48ee01;
    stim[20] = 66'h3a66c089d580ce5a8;
    stim[21] = 66'h1507bbb5b213a4ed5;
    stim[22] = 66'h13f99a950b7490591;
    stim[23] = 66'h342b3dd3251edcaf3;
    stim[24] = 66'h019c6c3a45ae3e3ec;
    stim[25] = 66'h038909ac5dc68820c;
    stim[26] = 66'h1a6c4d97ccc4b1a92;
    stim[27] = 66'h349507a86ec89da16;
    stim[28] = 66'h1b4e19fee23f7940c;
    stim[29] = 66'h3bdcff6242e452a5b;
    stim[30] = 66'h3b55c6e1481d1c5ce;
    stim[31] = 66'h31982165751798d8b;
    stim[32] = 66'h3a5b5a4e7d41aab09;
    stim[33] = 66'h088a89628a90617c8;
    stim[34] = 66'h1f4ceb1eb0f079ff6;
    stim[35] = 66'h0fd65c29ea13d17fc;
    stim[36] = 66'h0a5cd8a2ee5a9a60b;
    stim[37] = 66'h26a1731e4816e5b9a;
    stim[38] = 66'h1edd65dd66dd53cfd;
    stim[39] = 66'h1fd7cf3e4b92552fa;
    stim[40] = 66'h3589fdf27db39010a;
    stim[41] = 66'h2ab555c7a1381598c;
    stim[42] = 66'h19a7833af3859b6c4;
    stim[43] = 66'h202c2fec0c677e8f1;
    stim[44] = 66'h3705429ab20b207ee;
    stim[45] = 66'h1eb1018026b5bef08;
    stim[46] = 66'h30bb15fda3608860a;
    stim[47] = 66'h2583891cd9fa4db0b;
    stim[48] = 66'h1ea71fc88bc848ed9;
    stim[49] = 66'h33a9a569a079bbbae;
    stim[50] = 66'h146c4a25f5a8875cf;
    stim[51] = 66'h01feba3ce0901069f;
    stim[52] = 66'h22377f091cd0bdb95;
    stim[53] = 66'h1bf6f39485f0f77ae;
    stim[54] = 66'h0c25c4d44f77b8d16;
    stim[55] = 66'h11c671d0fb23d0c2b;
    stim[56] = 66'h0e8a8865327a56a1e;
    stim[57] = 66'h180c766847a885fb8;
    stim[58] = 66'h256a27415cf5b3900;
    stim[59] = 66'h0e8b8f0b5d04a23bc;
    stim[60] = 66'h2550d1156fe39561a;
    stim[61] = 66'h06dedda928927267e;
    stim[62] = 66'h297178ba50ff497de;
    stim[63] = 66'h0b412a6d6d132f4a6;
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
      expv[0] = 1'h1;
      expv[1] = 1'h0;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h0;
      expv[7] = 1'h1;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h1;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h0;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h0;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h0;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h0;
      expv[53] = 1'h1;
      expv[54] = 1'h0;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h1;
      expv[62] = 1'h0;
      expv[63] = 1'h1;
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
