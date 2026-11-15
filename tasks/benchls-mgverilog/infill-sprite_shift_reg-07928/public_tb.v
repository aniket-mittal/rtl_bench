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

  mg_07928 dut (
    .clk(clk),
    .ce(in_vec[32:32]),
    .enable(in_vec[31:31]),
    .load(in_vec[30:27]),
    .load_in(in_vec[26:0]),
    .load_out(out_vec[31:5]),
    .bits(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h040abff0f;
    stim[1] = 33'h0d6f70be1;
    stim[2] = 33'h065db937f;
    stim[3] = 33'h0aac4cb62;
    stim[4] = 33'h1954ea59a;
    stim[5] = 33'h16e08b563;
    stim[6] = 33'h17063e1e7;
    stim[7] = 33'h0b4f8fd14;
    stim[8] = 33'h1b55f4a72;
    stim[9] = 33'h09bcda7e2;
    stim[10] = 33'h041a940d9;
    stim[11] = 33'h0ffe75f54;
    stim[12] = 33'h0349743ec;
    stim[13] = 33'h16b55b32c;
    stim[14] = 33'h0d41abe6f;
    stim[15] = 33'h15766c84d;
    stim[16] = 33'h1b97fe341;
    stim[17] = 33'h1260e4332;
    stim[18] = 33'h02661446e;
    stim[19] = 33'h14376aa82;
    stim[20] = 33'h02831eaf5;
    stim[21] = 33'h1b782e4ca;
    stim[22] = 33'h05d5faab7;
    stim[23] = 33'h1d86131d0;
    stim[24] = 33'h1fa94873e;
    stim[25] = 33'h07066c19a;
    stim[26] = 33'h04ba6186b;
    stim[27] = 33'h0794c2ac3;
    stim[28] = 33'h142e645dd;
    stim[29] = 33'h0d15fcf39;
    stim[30] = 33'h0d19cb140;
    stim[31] = 33'h094e0901b;
    stim[32] = 33'h01d8bec46;
    stim[33] = 33'h020a4bcbf;
    stim[34] = 33'h0e973ba77;
    stim[35] = 33'h066f32f7b;
    stim[36] = 33'h0dc25f9f2;
    stim[37] = 33'h151ce910e;
    stim[38] = 33'h15826fda4;
    stim[39] = 33'h08d9f7a5d;
    stim[40] = 33'h1d041fbc7;
    stim[41] = 33'h1dea85791;
    stim[42] = 33'h137dbf48e;
    stim[43] = 33'h10fd3c160;
    stim[44] = 33'h030d93684;
    stim[45] = 33'h18f628780;
    stim[46] = 33'h180729e62;
    stim[47] = 33'h13264f8d4;
    stim[48] = 33'h13475a9ed;
    stim[49] = 33'h0424ec1f1;
    stim[50] = 33'h106a6017e;
    stim[51] = 33'h1de607d06;
    stim[52] = 33'h08a993bf4;
    stim[53] = 33'h164757676;
    stim[54] = 33'h018d45ce9;
    stim[55] = 33'h066d88874;
    stim[56] = 33'h1c42d7fe8;
    stim[57] = 33'h036679492;
    stim[58] = 33'h1a87c48d2;
    stim[59] = 33'h16f2fcb3d;
    stim[60] = 33'h09eba3032;
    stim[61] = 33'h00a050aea;
    stim[62] = 33'h02645fec6;
    stim[63] = 33'h1ad6ce577;
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
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxb3xx;
      expv[6] = 32'hc116b374;
      expv[7] = 32'h0c7c3c74;
      expv[8] = 32'h0c7c3c74;
      expv[9] = 32'h0ce94e74;
      expv[10] = 32'h0ce94e74;
      expv[11] = 32'h0ce94e74;
      expv[12] = 32'h0ce94e74;
      expv[13] = 32'h0ce94e74;
      expv[14] = 32'h6ab64e88;
      expv[15] = 32'h6ab64e88;
      expv[16] = 32'hecb60988;
      expv[17] = 32'hecfc6830;
      expv[18] = 32'hecc86830;
      expv[19] = 32'hecc86830;
      expv[20] = 32'h6ec86830;
      expv[21] = 32'h6ec86830;
      expv[22] = 32'h6e5c9930;
      expv[23] = 32'h6e5c9930;
      expv[24] = 32'h0c5c3a00;
      expv[25] = 32'h5290e7cc;
      expv[26] = 32'h5290e7cc;
      expv[27] = 32'h5290e7cc;
      expv[28] = 32'h5290e7cc;
      expv[29] = 32'h5c90e7cc;
      expv[30] = 32'h5c90e7cc;
      expv[31] = 32'h5c90e7cc;
      expv[32] = 32'h5c90e7cc;
      expv[33] = 32'h5c90e7cc;
      expv[34] = 32'h5c90e7cc;
      expv[35] = 32'h5c90e7cc;
      expv[36] = 32'h5c90e7cc;
      expv[37] = 32'h5c90e7cc;
      expv[38] = 32'h399021cc;
      expv[39] = 32'h0490b488;
      expv[40] = 32'h0490b488;
      expv[41] = 32'h08907888;
      expv[42] = 32'hd590f230;
      expv[43] = 32'hd57e9130;
      expv[44] = 32'hd57e9100;
      expv[45] = 32'hd57e9100;
      expv[46] = 32'hd57e9000;
      expv[47] = 32'hd57e8f00;
      expv[48] = 32'hd59f1a00;
      expv[49] = 32'hd5b53d00;
      expv[50] = 32'hd5b53d00;
      expv[51] = 32'hd5b53d00;
      expv[52] = 32'hccb5a0cc;
      expv[53] = 32'hccb5a0cc;
      expv[54] = 32'h8eaea0cc;
      expv[55] = 32'h8eaea0cc;
      expv[56] = 32'h8eaea0cc;
      expv[57] = 32'h85ae9fcc;
      expv[58] = 32'h85ae9fcc;
      expv[59] = 32'h85899e44;
      expv[60] = 32'he5f99eb8;
      expv[61] = 32'he5f99eb8;
      expv[62] = 32'he5f99eb8;
      expv[63] = 32'he5f99eb8;
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
