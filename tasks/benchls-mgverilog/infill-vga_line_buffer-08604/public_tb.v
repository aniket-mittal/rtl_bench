// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 88;
  localparam OW = 41;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08604 dut (
    .clk(clk),
    .enable(in_vec[87:87]),
    .fb_addr(in_vec[86:55]),
    .hcount(in_vec[54:44]),
    .vcount(in_vec[43:33]),
    .sram_data(in_vec[32:1]),
    .sram_rdy(in_vec[0:0]),
    .rgb(out_vec[40:33]),
    .sram_addr(out_vec[32:1]),
    .sram_read(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 88'h476697831b829df2d18423;
    stim[1] = 88'h792068d2bcf71c5020a377;
    stim[2] = 88'ha6cfaf4b5468fd64584e49;
    stim[3] = 88'hde0c262aaeaf2c4706ee07;
    stim[4] = 88'h1e68452604d96231ab9942;
    stim[5] = 88'hbea61dd25df34dae0b144b;
    stim[6] = 88'hadcc7ea43257a13658ad45;
    stim[7] = 88'h67bd29ffc6150163abb9db;
    stim[8] = 88'h0044b3f978cfd160c1cd57;
    stim[9] = 88'hbb7351b0ed17e46e653e2b;
    stim[10] = 88'h54ce9c143198cc990ee565;
    stim[11] = 88'h4dc98621d9073301e8ea8f;
    stim[12] = 88'h2ed5fd0cada1742f284d7b;
    stim[13] = 88'h9041792ee705488b8b9872;
    stim[14] = 88'hf6518dc3e0046588cf2b1e;
    stim[15] = 88'hca0be28f4b2881bb0e6243;
    stim[16] = 88'h41879da865b8dbef9a541e;
    stim[17] = 88'h05d657f69d2a72f6a64398;
    stim[18] = 88'hb97b05d12a4986d156e34b;
    stim[19] = 88'h3b3a7bd695dd854b5c8290;
    stim[20] = 88'h728c74f81ccb70d10815e4;
    stim[21] = 88'hd886f36c858aecac6d9a6d;
    stim[22] = 88'he471fd73e20a48c3b4dcc0;
    stim[23] = 88'h3a9610895820e88812eb89;
    stim[24] = 88'h4917d21069d7013c7e3145;
    stim[25] = 88'hb19c02650782f6eb97493a;
    stim[26] = 88'h90e2b24e13a433e693898b;
    stim[27] = 88'h2ce193adaa07913cc1c316;
    stim[28] = 88'h7d98ec5eef074a6312acee;
    stim[29] = 88'h71aeee0a46ab5aec2efe06;
    stim[30] = 88'h1807af3859f2da1f4ea991;
    stim[31] = 88'he948b37eb49d83622e3959;
    stim[32] = 88'h147f7a3ac22d0faae12a7f;
    stim[33] = 88'h6a3cee52dc33ac2b45653d;
    stim[34] = 88'h17934d84b53ab28a40df8d;
    stim[35] = 88'hae4be01590ff2c67fbbf19;
    stim[36] = 88'h1a0a8dd2ed3d119f680257;
    stim[37] = 88'h422858d5a7831df9c21443;
    stim[38] = 88'h8822a8031d57a57a449d2f;
    stim[39] = 88'h0e22a1fd0c070bc0dea12a;
    stim[40] = 88'h6ef59148050ff9a4b7fd11;
    stim[41] = 88'h488f52ed783078cb651f44;
    stim[42] = 88'hbb848a3aeb828d6d427a64;
    stim[43] = 88'hc3758157f6ab1520eb6f6f;
    stim[44] = 88'ha8cf06ea292b749b018b30;
    stim[45] = 88'h6c84bfc0cfb91a94dd939e;
    stim[46] = 88'h5922c14350352071cec86e;
    stim[47] = 88'h2cb317732a3a2d42fed382;
    stim[48] = 88'h53f41506e0d1aafc13e1e5;
    stim[49] = 88'h716e4a6db63a0f2feb2605;
    stim[50] = 88'h952e16da1897ee5b8561bf;
    stim[51] = 88'h8294104d5979e84dbded3e;
    stim[52] = 88'h7ae1197c7c8a62fa81cbb9;
    stim[53] = 88'h3c86a89fe97cd45009f5c9;
    stim[54] = 88'h92a305f6f7cceb2547403f;
    stim[55] = 88'h185a33b49d03254eb165fd;
    stim[56] = 88'hc30e85f8a0e2d2986c5fdd;
    stim[57] = 88'he323e3515d12c91003a806;
    stim[58] = 88'h196dd99820c402362d9423;
    stim[59] = 88'h9c089775fbdbe5fbf5e5b9;
    stim[60] = 88'hb41e5eb23994d7054bf790;
    stim[61] = 88'hf2c53be267b55ccfb78166;
    stim[62] = 88'hda2fed7b9a6dff5b5b248e;
    stim[63] = 88'he972dc1dc5a735e9b36618;
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
      expv[0] = 41'hxxx1d9a630c;
      expv[1] = 41'hxxxe488294a;
      expv[2] = 41'hxxx9b508335;
      expv[3] = 41'hxxx78470ebb;
      expv[4] = 41'hxxx79c702b0;
      expv[5] = 41'hxxxfaafec49;
      expv[6] = 41'hxxxb73a3899;
      expv[7] = 41'hxxx9f07b80e;
      expv[8] = 41'hxxx011f4ffc;
      expv[9] = 41'hxxxedf4cee3;
      expv[10] = 41'hxxx534e2a78;
      expv[11] = 41'hxxx373c16b6;
      expv[12] = 41'hxxxbb69f16a;
      expv[13] = 41'hxxx410986fb;
      expv[14] = 41'hxxxd9536b0f;
      expv[15] = 41'hxxx283a843d;
      expv[16] = 41'hxxx0633b6a8;
      expv[17] = 41'hxxx176f80da;
      expv[18] = 41'hxxxe6063445;
      expv[19] = 41'hxxxed01be62;
      expv[20] = 41'hxxxca539de0;
      expv[21] = 41'hxxx623865b3;
      expv[22] = 41'hxxx91e343d7;
      expv[23] = 41'hxxxea71f624;
      expv[24] = 41'hxxx24618c48;
      expv[25] = 41'hxxxc68189a5;
      expv[26] = 41'hxxx43923039;
      expv[27] = 41'hxxxb390cbbe;
      expv[28] = 41'hxxxf676997a;
      expv[29] = 41'hxxxc6cdf128;
      expv[30] = 41'hxxx603b1de0;
      expv[31] = 41'hxxxa529ef03;
      expv[32] = 41'hxxx521fadfa;
      expv[33] = 41'hxxxa9145c62;
      expv[34] = 41'hxxx5e566432;
      expv[35] = 41'hxxxb94a3d7f;
      expv[36] = 41'hxxx6850257a;
      expv[37] = 41'hxxx08c20b8e;
      expv[38] = 41'hxxx2092664d;
      expv[39] = 41'hxxx389da23c;
      expv[40] = 41'hxxxbbe7de20;
      expv[41] = 41'hxxx226537bc;
      expv[42] = 41'hxxxee1354eb;
      expv[43] = 41'hxxx0ddc635f;
      expv[44] = 41'hxxxa357cdb1;
      expv[45] = 41'hxxxb22fa102;
      expv[46] = 41'hxxx64a1c60c;
      expv[47] = 41'hxxxb2d92dcc;
      expv[48] = 41'hxxx4fe9c21a;
      expv[49] = 41'hxxxc5bd52be;
      expv[50] = 41'hxxx54d17e79;
      expv[51] = 41'hxxx0a64144d;
      expv[52] = 41'hxxxeb9d29f0;
      expv[53] = 41'hxxxf2349786;
      expv[54] = 41'hxxx4aac29eb;
      expv[55] = 41'hxxx618917ea;
      expv[56] = 41'hxxx0c41f203;
      expv[57] = 41'hxxx8c969a6d;
      expv[58] = 41'hxxx65be5a60;
      expv[59] = 41'hxxx702c62df;
      expv[60] = 41'hxxxd09734d9;
      expv[61] = 41'hxxxcb210689;
      expv[62] = 41'hxxx68cd1bef;
      expv[63] = 41'hxxxa5ee6b77;
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
