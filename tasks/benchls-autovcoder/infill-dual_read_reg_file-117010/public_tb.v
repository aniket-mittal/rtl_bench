// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 52;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_117010 dut (
    .clk(clk),
    .reset_b(in_vec[51:51]),
    .halt(in_vec[50:50]),
    .addra(in_vec[49:45]),
    .a_en(in_vec[44:44]),
    .addrb(in_vec[43:39]),
    .b_en(in_vec[38:38]),
    .addrc(in_vec[37:33]),
    .dc(in_vec[32:1]),
    .wec(in_vec[0:0]),
    .qra(out_vec[63:32]),
    .qrb(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 52'h0ae67c27903a7;
    stim[1] = 52'h7bae6f2014dec;
    stim[2] = 52'hbdbff406f2f3d;
    stim[3] = 52'hcee6bd650da5f;
    stim[4] = 52'hd094d0963d21c;
    stim[5] = 52'hd4f5dc25df312;
    stim[6] = 52'hba6a2865ecf92;
    stim[7] = 52'he3d9f04f711ab;
    stim[8] = 52'hfedfe05502691;
    stim[9] = 52'heccf84cecc363;
    stim[10] = 52'hd7424e4486ef5;
    stim[11] = 52'he179f5e69f518;
    stim[12] = 52'he0ab6ac89c0e1;
    stim[13] = 52'h9aa7ba7542a1d;
    stim[14] = 52'hc452e465b2e66;
    stim[15] = 52'h8b7f1f3961516;
    stim[16] = 52'heb181aca315fa;
    stim[17] = 52'hf0011fbebad0a;
    stim[18] = 52'h993f7f9281b23;
    stim[19] = 52'hf7e3904de0e78;
    stim[20] = 52'h8d7b356f50fc9;
    stim[21] = 52'hc58d218a16e24;
    stim[22] = 52'h8375f371de2cd;
    stim[23] = 52'h8d21e725eded0;
    stim[24] = 52'ha40ad069d6422;
    stim[25] = 52'hc83c4a4874972;
    stim[26] = 52'hc0cdefbb27091;
    stim[27] = 52'hb170bbff5c2f3;
    stim[28] = 52'h855beaa5f3cd5;
    stim[29] = 52'hdf8d5bb854e25;
    stim[30] = 52'ha4b945c98baef;
    stim[31] = 52'h9de03284e8092;
    stim[32] = 52'hbd23cced9419b;
    stim[33] = 52'hdb50ce6096817;
    stim[34] = 52'hbfbdcabb4f71c;
    stim[35] = 52'hfe1cc84b048c2;
    stim[36] = 52'h97fdb73ff6ef9;
    stim[37] = 52'hf79f54348efcf;
    stim[38] = 52'h5668d7531c3e1;
    stim[39] = 52'h96faea180d022;
    stim[40] = 52'ha322725fba462;
    stim[41] = 52'ha34f4f7e698bf;
    stim[42] = 52'hd1a7ab5716b95;
    stim[43] = 52'hebf13c8052206;
    stim[44] = 52'h9a0ba72372d67;
    stim[45] = 52'hace3c4399a42c;
    stim[46] = 52'hef160d724bd97;
    stim[47] = 52'h89e8671ad8086;
    stim[48] = 52'hccd58324627f8;
    stim[49] = 52'hbd811de767346;
    stim[50] = 52'hb67e1ffa6b991;
    stim[51] = 52'hb9412ad81e797;
    stim[52] = 52'hcef5056eb2173;
    stim[53] = 52'hf33b39e3067cc;
    stim[54] = 52'he42e7aee8a3f7;
    stim[55] = 52'ha5c7321fa9f7b;
    stim[56] = 52'hdc381975c60b4;
    stim[57] = 52'hb88b4809e42fa;
    stim[58] = 52'hdeceff348f089;
    stim[59] = 52'hc1b84b6f92a98;
    stim[60] = 52'hd1d294f747f3a;
    stim[61] = 52'h850d04c2d4e84;
    stim[62] = 52'hec3b72e31b902;
    stim[63] = 52'hb471d817aeae8;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'hxxxxxxxxxxxxxxxx;
      expv[3] = 64'hxxxxxxxxxxxxxxxx;
      expv[4] = 64'hxxxxxxxxxxxxxxxx;
      expv[5] = 64'hxxxxxxxxxxxxxxxx;
      expv[6] = 64'hxxxxxxxxxxxxxxxx;
      expv[7] = 64'hxxxxxxxxxxxxxxxx;
      expv[8] = 64'h02a81348xxxxxxxx;
      expv[9] = 64'hxxxxxxxxxxxxxxxx;
      expv[10] = 64'hxxxxxxxxxxxxxxxx;
      expv[11] = 64'hxxxxxxxx827b88d5;
      expv[12] = 64'hxxxxxxxxeb286d2f;
      expv[13] = 64'hxxxxxxxxxxxxxxxx;
      expv[14] = 64'hxxxxxxxxxxxxxxxx;
      expv[15] = 64'hxxxxxxxx827b88d5;
      expv[16] = 64'heb286d2fxxxxxxxx;
      expv[17] = 64'hxxxxxxxxxxxxxxxx;
      expv[18] = 64'hxxxxxxxxxxxxxxxx;
      expv[19] = 64'hfc940d91267661b1;
      expv[20] = 64'hxxxxxxxx827b88d5;
      expv[21] = 64'hxxxxxxxxxxxxxxxx;
      expv[22] = 64'hxxxxxxxxxxxxxxxx;
      expv[23] = 64'hxxxxxxxxxxxxxxxx;
      expv[24] = 64'h7224377axxxxxxxx;
      expv[25] = 64'hxxxxxxxxxxxxxxxx;
      expv[26] = 64'hxxxxxxxxab7a87e4;
      expv[27] = 64'hxxxxxxxxxxxxxxxx;
      expv[28] = 64'hxxxxxxxxxxxxxxxx;
      expv[29] = 64'h7dd93848xxxxxxxx;
      expv[30] = 64'h7224377axxxxxxxx;
      expv[31] = 64'hxxxxxxxx267661b1;
      expv[32] = 64'h676ca0cdxxxxxxxx;
      expv[33] = 64'hxxxxxxxx2e4c5d77;
      expv[34] = 64'h552f9e6axxxxxxxx;
      expv[35] = 64'h552f9e6axxxxxxxx;
      expv[36] = 64'hxxxxxxxx552f9e6a;
      expv[37] = 64'hfc940d91xxxxxxxx;
      expv[38] = 64'hxxxxxxxxxxxxxxxx;
      expv[39] = 64'hxxxxxxxxxxxxxxxx;
      expv[40] = 64'hxxxxxxxxxxxxxxxx;
      expv[41] = 64'hxxxxxxxxxxxxxxxx;
      expv[42] = 64'hxxxxxxxxxxxxxxxx;
      expv[43] = 64'hxxxxxxxxxxxxxxxx;
      expv[44] = 64'hxxxxxxxxxxxxxxxx;
      expv[45] = 64'hxxxxxxxxxxxxxxxx;
      expv[46] = 64'hxxxxxxxxxxxxxxxx;
      expv[47] = 64'hxxxxxxxx391b96b3;
      expv[48] = 64'hxxxxxxxx7bf34c5f;
      expv[49] = 64'hxxxxxxxx6b925ecb;
      expv[50] = 64'hxxxxxxxxxxxxxxxx;
      expv[51] = 64'hxxxxxxxxxxxxxxxx;
      expv[52] = 64'hxxxxxxxxxxxxxxxx;
      expv[53] = 64'hxxxxxxxxxxxxxxxx;
      expv[54] = 64'hxxxxxxxxxxxxxxxx;
      expv[55] = 64'hxxxxxxxxxxxxxxxx;
      expv[56] = 64'hxxxxxxxxxxxxxxxx;
      expv[57] = 64'hxxxxxxxxxxxxxxxx;
      expv[58] = 64'hxxxxxxxx90fd4fbd;
      expv[59] = 64'hxxxxxxxxf9a47844;
      expv[60] = 64'h2b7590b97bf34c5f;
      expv[61] = 64'hxxxxxxxxxxxxxxxx;
      expv[62] = 64'hxxxxxxxxxxxxxxxx;
      expv[63] = 64'h7bf34c5fxxxxxxxx;
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
