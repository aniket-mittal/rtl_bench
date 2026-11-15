// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 73;
  localparam OW = 105;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_097332 dut (
    .i_clk(clk),
    .i_cmd_reset(in_vec[72:72]),
    .i_cmd_valid(in_vec[71:71]),
    .i_cmd_data(in_vec[70:35]),
    .i_wb_ack(in_vec[34:34]),
    .i_wb_err(in_vec[33:33]),
    .i_wb_stall(in_vec[32:32]),
    .i_wb_data(in_vec[31:0]),
    .o_cmd_ready(out_vec[104:104]),
    .o_resp_valid(out_vec[103:103]),
    .o_resp_data(out_vec[102:67]),
    .o_wb_cyc(out_vec[66:66]),
    .o_wb_stb(out_vec[65:65]),
    .o_wb_we(out_vec[64:64]),
    .o_wb_addr(out_vec[63:32]),
    .o_wb_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 73'h1afb586933907d55913;
    stim[1] = 73'h18c3a71553098b5e272;
    stim[2] = 73'h00756770e20440aa21d;
    stim[3] = 73'h005a3002320237febb6;
    stim[4] = 73'h05ccbee85b018102935;
    stim[5] = 73'h09fea084bda563d7f22;
    stim[6] = 73'h0e3dc92b9191a163484;
    stim[7] = 73'h0b2a8e6bfea9212540c;
    stim[8] = 73'h0b1c8c40c87793a3939;
    stim[9] = 73'h07e02cf442936266a78;
    stim[10] = 73'h0266c2f36b31d72ec28;
    stim[11] = 73'h02918bd8fb4f1921f8d;
    stim[12] = 73'h0e81dab54fee03db98f;
    stim[13] = 73'h001b3292759a3820f89;
    stim[14] = 73'h051e6b5d96b1b6bbaa9;
    stim[15] = 73'h0a7636f7e18bce8d154;
    stim[16] = 73'h0f22dd56506119c2986;
    stim[17] = 73'h01332d6f050b92b8290;
    stim[18] = 73'h0761bc0cb50fc6f943b;
    stim[19] = 73'h0647c206a3863be298b;
    stim[20] = 73'h069e940e23017fe43a7;
    stim[21] = 73'h049f173b7fd68db9f0d;
    stim[22] = 73'h03a6d158d1e121aa770;
    stim[23] = 73'h017574a645724103e3f;
    stim[24] = 73'h0a3381f639ae8fce051;
    stim[25] = 73'h0ae201a6efbd76205bb;
    stim[26] = 73'h0099733964370446f7f;
    stim[27] = 73'h0f597c9f6be4edf55a1;
    stim[28] = 73'h0be9404e967d10c22b0;
    stim[29] = 73'h0600b78e3853fcf3684;
    stim[30] = 73'h090a6577a54cfe0a88b;
    stim[31] = 73'h05995c93cedf50a5e9a;
    stim[32] = 73'h0efd836b5dc7f71db26;
    stim[33] = 73'h10025b38e8418119691;
    stim[34] = 73'h0ea07cacdee0d739a04;
    stim[35] = 73'h0748ea984ef7eb6a2d0;
    stim[36] = 73'h093452ca8a621d08b15;
    stim[37] = 73'h042bd961cb3b9c4b576;
    stim[38] = 73'h02014c418d8c397b98c;
    stim[39] = 73'h0ef936ed6db32223610;
    stim[40] = 73'h0938cd60356d889686d;
    stim[41] = 73'h03e3542229ef8c40b59;
    stim[42] = 73'h09cebb2032c5a760161;
    stim[43] = 73'h0d6b8a03b15b7f4dcb3;
    stim[44] = 73'h0f8083f711cfb586aac;
    stim[45] = 73'h0be5f800eee82f36ea8;
    stim[46] = 73'h0cafe9ca3f50c74f740;
    stim[47] = 73'h0e01f537253ea5e9ef3;
    stim[48] = 73'h108cbe1728fa0240aa2;
    stim[49] = 73'h0d7d24359b2e461b528;
    stim[50] = 73'h0b0abaa74a4cafa19ae;
    stim[51] = 73'h092a4f07a2e05bc6256;
    stim[52] = 73'h06dda65bc58c2a31f24;
    stim[53] = 73'h0db8e7331b068d344fa;
    stim[54] = 73'h0f6e067c0f56a0e2820;
    stim[55] = 73'h097402cab1678ea0678;
    stim[56] = 73'h0e6528c43cfb5f3dcf4;
    stim[57] = 73'h010eec0c521ff387471;
    stim[58] = 73'h08066bc8eedc0d700e7;
    stim[59] = 73'h02563250678c21b43b4;
    stim[60] = 73'h01b9a0b2815a2615aa7;
    stim[61] = 73'h043ae3b7564c337497c;
    stim[62] = 73'h08714132752bb132a9b;
    stim[63] = 73'h0722e780aeb0d2e2b29;
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
      expv[0] = 105'hxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 105'h17800000000xxxxxxxxxxxxxxxx;
      expv[2] = 105'h17800000000xxxxxxxxxxxxxxxx;
      expv[3] = 105'h17800000000xxxxxxxxxxxxxxxx;
      expv[4] = 105'h17800000000xxxxxxxxxxxxxxxx;
      expv[5] = 105'h17800000000xxxxxxxxxxxxxxxx;
      expv[6] = 105'h19fea084bd8xxxxxxxxxxxxxxxx;
      expv[7] = 105'h1f000000000xxxxxxxxxxxxxxxx;
      expv[8] = 105'h1f000000000xxxxxxxxxxxxxxxx;
      expv[9] = 105'h1f000000000xxxxxxxxxxxxxxxx;
      expv[10] = 105'h17000000000xxxxxxxxxxxxxxxx;
      expv[11] = 105'h17000000000xxxxxxxxxxxxxxxx;
      expv[12] = 105'h17000000000xxxxxxxxxxxxxxxx;
      expv[13] = 105'h1f000000000xxxxxxxxxxxxxxxx;
      expv[14] = 105'h17000000000xxxxxxxxxxxxxxxx;
      expv[15] = 105'h17000000000xxxxxxxxxxxxxxxx;
      expv[16] = 105'h19f636f7e18xxxxxxxxxxxxxxxx;
      expv[17] = 105'h1f000000000xxxxxxxxxxxxxxxx;
      expv[18] = 105'h17000000000xxxxxxxxxxxxxxxx;
      expv[19] = 105'h17000000000xxxxxxxxxxxxxxxx;
      expv[20] = 105'h17000000000xxxxxxxxxxxxxxxx;
      expv[21] = 105'h17000000000xxxxxxxxxxxxxxxx;
      expv[22] = 105'h17000000000xxxxxxxxxxxxxxxx;
      expv[23] = 105'h17000000000xxxxxxxxxxxxxxxx;
      expv[24] = 105'h17000000000xxxxxxxxxxxxxxxx;
      expv[25] = 105'h19b381f6398xxxxxxxxxxxxxxxx;
      expv[26] = 105'h1f000000000xxxxxxxxxxxxxxxx;
      expv[27] = 105'h17000000000xxxxxxxxxxxxxxxx;
      expv[28] = 105'h1f000000000xxxxxxxxxxxxxxxx;
      expv[29] = 105'h1f000000000xxxxxxxxxxxxxxxx;
      expv[30] = 105'h17000000000xxxxxxxxxxxxxxxx;
      expv[31] = 105'h070000000076703ec7314caef4a;
      expv[32] = 105'h070000000076703ec7314caef4a;
      expv[33] = 105'h070000000056703ec7314caef4a;
      expv[34] = 105'h178000000006703ec7314caef4a;
      expv[35] = 105'h1f0000000006703ec7314caef4a;
      expv[36] = 105'h170000000006703ec7314caef4a;
      expv[37] = 105'h070000000076703ec7368a59514;
      expv[38] = 105'h070000000076703ec7368a59514;
      expv[39] = 105'h070000000056703ec7368a59514;
      expv[40] = 105'h070000000016703ec7368a59514;
      expv[41] = 105'h0f0000000016703ec7368a59514;
      expv[42] = 105'h170000000016703ec7368a59514;
      expv[43] = 105'h19cebb203296703ec7368a59514;
      expv[44] = 105'h1f0000000016703ec7368a59514;
      expv[45] = 105'h1f0000000016703ec7368a59514;
      expv[46] = 105'h1f0000000016703ec7368a59514;
      expv[47] = 105'h1f0000000016703ec7368a59514;
      expv[48] = 105'h1f0000000016703ec7368a59514;
      expv[49] = 105'h178000000006703ec7368a59514;
      expv[50] = 105'h1f0000000006703ec7368a59514;
      expv[51] = 105'h1f0000000006703ec7368a59514;
      expv[52] = 105'h0f0000000079d764065549e0f45;
      expv[53] = 105'h0f0000000059d764065549e0f45;
      expv[54] = 105'h0f0000000059d764065549e0f45;
      expv[55] = 105'h0f0000000019d764065549e0f45;
      expv[56] = 105'h090000000019d764065549e0f45;
      expv[57] = 105'h1f0000000019d764065549e0f45;
      expv[58] = 105'h170000000019d764065549e0f45;
      expv[59] = 105'h1f0000000019d764065549e0f45;
      expv[60] = 105'h170000000019d764065549e0f45;
      expv[61] = 105'h170000000019d764065549e0f45;
      expv[62] = 105'h170000000019d764065549e0f45;
      expv[63] = 105'h1f0000000019d764065549e0f45;
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
